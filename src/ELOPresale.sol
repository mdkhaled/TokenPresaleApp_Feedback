// SPDX-License-Identifier: None
pragma solidity ^0.8.30;

import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {IERC20} from "@openzeppelin/contracts/interfaces/IERC20.sol";
import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {TransferHelper} from "./TransferHelper.sol";

/// @title ELOPresale
/// @author Md. Khaled Hussain (presumed)
/// @notice A simple ETH-based token presale contract with softcap, hardcap, min/max contribution, buyer accounting, token withdrawals on success, and refunds on failure.
/// @dev Uses OpenZeppelin `ReentrancyGuard` and `Ownable`. Token transfers use a local `TransferHelper`. Contract assumes token is ERC-20 compliant.
contract ELOPresale is ReentrancyGuard, Ownable {

    /// -----------------------------------------------------------------------
    /// Structs
    /// -----------------------------------------------------------------------

    /// @notice Holds presale configuration parameters.
    struct PresaleInfo {
        /// @notice Token being sold.
        address sale_token;
        /// @notice Number of sale tokens per 1 base token (ETH), i.e., token price numerator.
        uint256 token_rate;
        /// @notice Minimum contribution per buyer (in base token / wei).
        uint256 raise_min;
        /// @notice Maximum contribution per buyer (in base token / wei).
        uint256 raise_max;
        /// @notice Minimum total raised amount for presale to be successful (softcap).
        uint256 softcap;
        /// @notice Maximum total raise allowed (hardcap).
        uint256 hardcap;
        /// @notice Presale start timestamp (UNIX).
        uint256 presale_start;
        /// @notice Presale end timestamp (UNIX).
        uint256 presale_end;
    }

    /// @notice Tracks runtime status of the presale.
    struct PresaleStatus {
        /// @notice Can be set to force failure (not implemented setter here).
        bool force_failed;
        /// @notice Total base tokens raised (wei).
        uint256 raised_amount;
        /// @notice Total presale tokens allocated/sold to buyers.
        uint256 sold_amount;
        /// @notice Total presale tokens withdrawn by buyers.
        uint256 token_withdraw;
        /// @notice Total base tokens withdrawn as refunds.
        uint256 base_withdraw;
        /// @notice Number of unique buyers who participated.
        uint256 num_buyers;
    }

    /// @notice Per-buyer accounting record.
    struct BuyerInfo {
        /// @notice Base tokens contributed by buyer (wei).
        uint256 base;
        /// @notice Sale tokens allocated to buyer.
        uint256 sale;
    }
    
    /// @notice On-chain copy of token metadata for the sale token.
    struct TokenInfo {
        string name;
        string symbol;
        uint256 totalsupply;
        uint256 decimal;
    }
  
    /// -----------------------------------------------------------------------
    /// State variables
    /// -----------------------------------------------------------------------

    /// @notice Presale configuration.
    PresaleInfo public presale_info;

    /// @notice Live presale status.
    PresaleStatus public status;

    /// @notice Token metadata snapshot.
    TokenInfo public tokeninfo;

    /// @notice Buyer address => buyer information mapping.
    mapping(address => BuyerInfo) public buyers;

    /// @notice Emitted when a user successfully deposits into the presale.
    /// @param user Buyer address.
    /// @param amount Amount of base token (wei) deposited.
    event UserDepsitedSuccess(address indexed user, uint256 amount);

    /// @notice Emitted when a user or owner withdraws base or token amounts.
    /// @param amount Amount withdrawn.
    event UserWithdrawSuccess(uint256 amount);

    /// @notice Emitted when a user withdraws purchased presale tokens.
    /// @param amount Number of sale tokens withdrawn.
    event UserWithdrawTokensSuccess(uint256 amount);

    /// @notice Burn / dead address constant used in other contexts.
    address deadaddr = 0x000000000000000000000000000000000000dEaD;

    /// -----------------------------------------------------------------------
    /// Constructor
    /// -----------------------------------------------------------------------

    /// @notice Initializes the presale contract and sets the owner.
    /// @dev Note: OpenZeppelin's Ownable typically sets owner to msg.sender in its constructor
    ///      and does not accept an address argument. This constructor calls `Ownable(msg.sender)`
    ///      because it was present in your original code; confirm your Ownable version.
    constructor() Ownable(msg.sender) {
        // constructor body intentionally left blank
    }

    /// -----------------------------------------------------------------------
    /// Initialization
    /// -----------------------------------------------------------------------

    /// @notice Initialize or configure the presale parameters. Owner-only.
    /// @dev This function reads token metadata via IERC20/IERC20Metadata.
    /// @param _sale_token Address of the ERC20 sale token.
    /// @param _token_rate Number of sale tokens per 1 base token (ETH).
    /// @param _raise_min Minimum contribution per buyer (wei).
    /// @param _raise_max Maximum contribution per buyer (wei).
    /// @param _softcap Softcap amount (wei).
    /// @param _hardcap Hardcap amount (wei).
    /// @param _presale_start Presale start timestamp (UNIX).
    /// @param _presale_end Presale end timestamp (UNIX).
    function init_private (
        address _sale_token,
        uint256 _token_rate,
        uint256 _raise_min, 
        uint256 _raise_max, 
        uint256 _softcap, 
        uint256 _hardcap,
        uint256 _presale_start,
        uint256 _presale_end
    ) public onlyOwner {

        require(_sale_token != address(0), "Zero Address");
        
        presale_info.sale_token = address(_sale_token);
        presale_info.token_rate = _token_rate;
        presale_info.raise_min = _raise_min;
        presale_info.raise_max = _raise_max;
        presale_info.softcap = _softcap;
        presale_info.hardcap = _hardcap;

        presale_info.presale_end = _presale_end;
        presale_info.presale_start =  _presale_start;
        
        // Set token metadata snapshot
        tokeninfo.name = IERC20Metadata(presale_info.sale_token).name();
        tokeninfo.symbol = IERC20Metadata(presale_info.sale_token).symbol();
        tokeninfo.decimal = IERC20Metadata(presale_info.sale_token).decimals();
        tokeninfo.totalsupply = IERC20(presale_info.sale_token).totalSupply();
    }

    /// -----------------------------------------------------------------------
    /// View / status helpers
    /// -----------------------------------------------------------------------

    /// @notice Returns a numeric presale status code.
    /// @dev Status codes: 0 = QUEUED, 1 = ACTIVE, 2 = SUCCESS, 3 = FAILURE.
    /// @return uint256 corresponding status code described above.
    function presaleStatus() public view returns (uint256) {
        if ((block.timestamp > presale_info.presale_end) && (status.raised_amount < presale_info.softcap)) {
            return 3; // Failure
        }
        if (status.raised_amount >= presale_info.hardcap) {
            return 2; // Wonderful - reached to Hardcap
        }
        if ((block.timestamp > presale_info.presale_end) && (status.raised_amount >= presale_info.softcap)) {
            return 2; // SUCCESS - Presale ended with reaching Softcap
        }
        if ((block.timestamp >= presale_info.presale_start) && (block.timestamp <= presale_info.presale_end)) {
            return 1; // ACTIVE - Deposits enabled, now in Presale
        }
            return 0; // QUEUED - Awaiting start
    }
    
    /// -----------------------------------------------------------------------
    /// Mutative functions - user flows
    /// -----------------------------------------------------------------------

    /// @notice Deposit base currency (ETH) to participate in the presale.
    /// @dev Accepts `msg.value` only. Limits per-buyer min/max and global hardcap are enforced.
    ///      Any excess ETH beyond allowable amount will be returned to the sender.
    /// @dev nonReentrant protects against reentrancy attacks on ETH transfers.
    function userDeposit () public payable nonReentrant {
        require(presaleStatus() == 1, "Not Active");
        require(presale_info.raise_min <= msg.value, "Balance is insufficent");
        require(presale_info.raise_max >= msg.value, "Balance is too much");

        BuyerInfo storage buyer = buyers[msg.sender];

        uint256 amount_in = msg.value;
        uint256 allowance = presale_info.raise_max - buyer.base;
        uint256 remaining = presale_info.hardcap - status.raised_amount;

        allowance = allowance > remaining ? remaining : allowance;
        if (amount_in > allowance) {
            amount_in = allowance;
        }

        uint256 tokensSold = amount_in * presale_info.token_rate;

        require(tokensSold > 0, "ZERO TOKENS");
        require(status.raised_amount * presale_info.token_rate <= IERC20(presale_info.sale_token).balanceOf(address(this)), "Token remain error");
        
        if (buyer.base == 0) {
            status.num_buyers++;
        }
        buyers[msg.sender].base = buyers[msg.sender].base + amount_in;
        buyers[msg.sender].sale = buyers[msg.sender].sale + tokensSold;
        status.raised_amount = status.raised_amount + amount_in;
        status.sold_amount = status.sold_amount + tokensSold;
        
        // return unused ETH
        if (amount_in < msg.value) {
            payable(msg.sender).transfer(msg.value - amount_in);
        }
        
        emit UserDepsitedSuccess(msg.sender, msg.value);
    }
    
    /// @notice Withdraw purchased presale tokens after a successful presale.
    /// @dev Uses `TransferHelper.safeTransfer` for token transfer which should handle ERC-20 quirks.
    function userWithdrawTokens () public nonReentrant {
        require(presaleStatus() == 2, "Not succeeded"); // Success
        
        BuyerInfo storage buyer = buyers[msg.sender];
        uint256 remaintoken = status.sold_amount - status.token_withdraw;
        require(remaintoken >= buyer.sale, "Nothing to withdraw.");
        require(buyers[msg.sender].sale != 0, "Nothing to withdraw");

        TransferHelper.safeTransfer(address(presale_info.sale_token), msg.sender, buyer.sale);
        
        status.token_withdraw = status.token_withdraw + buyer.sale;
        buyers[msg.sender].sale = 0;
        buyers[msg.sender].base = 0;
        
        emit UserWithdrawTokensSuccess(buyer.sale);
    }
    
    /// @notice Withdraw contributed base tokens (ETH) on presale failure.
    /// @dev Refund is only allowed when presaleStatus() == 3 (FAILURE).
    function userWithdrawBaseTokens () public nonReentrant {
        require(presaleStatus() == 3, "Not failed."); // FAILED
        
        // Refund
        BuyerInfo storage buyer = buyers[msg.sender];
        
        uint256 remainingBaseBalance = address(this).balance;
        
        require(remainingBaseBalance >= buyer.base, "Nothing to withdraw.");

        status.base_withdraw = status.base_withdraw + buyer.base;
        
        address payable reciver = payable(msg.sender);
        reciver.transfer(buyer.base);

        if(msg.sender == owner()) {
            ownerWithdrawTokens();
            // return;
        }
        buyer.base = 0;
        buyer.sale = 0;
        
        emit UserWithdrawSuccess(buyer.base);
    }
    
    /// -----------------------------------------------------------------------
    /// Owner functions
    /// -----------------------------------------------------------------------

    /// @notice Withdraw all sale tokens (unsold) to the owner on presale failure.
    /// @dev Private and onlyOwner in original code. This means it will be triggered internally (e.g., in userWithdrawBaseTokens).
    function ownerWithdrawTokens () private onlyOwner {
        require(presaleStatus() == 3, "Only failed status."); // Failed
        TransferHelper.safeTransfer(address(presale_info.sale_token), owner(), IERC20(presale_info.sale_token).balanceOf(address(this)));
        
        emit UserWithdrawSuccess(IERC20(presale_info.sale_token).balanceOf(address(this)));
    }

    /// @notice Withdraw all base funds (ETH) raised by owner after successful presale.
    /// @dev onlyOwner and nonReentrant are recommended; original code used onlyOwner + nonReentrant on caller functions.
    function purchaseICOCoin () public nonReentrant onlyOwner {
        require(presaleStatus() == 2, "Not succeeded"); // Success
        
        address payable reciver = payable(owner());
        reciver.transfer(address(this).balance);
    }

    /// @notice Returns current block timestamp (helper).
    /// @return uint256 Current block timestamp.
    function getTimestamp () public view returns (uint256) {
        return block.timestamp;
    }

    /// @notice Refund any remaining tokens to owner after successful presale when sale is ended.
    /// @dev Only owner can call. Useful if owner wants unsold tokens back after success.
    function refundTokens() public onlyOwner {
        require(presaleStatus() == 2, "Not succeeded"); // Success
        require(block.timestamp > presale_info.presale_end, "Must be after presale end time");
 
        uint256 refundTokenAmount = IERC20(presale_info.sale_token).balanceOf(address(this));

        require(refundTokenAmount > 0, "No token in this contract now.");

        TransferHelper.safeTransfer(address(presale_info.sale_token), address(msg.sender), refundTokenAmount);
    }
}
