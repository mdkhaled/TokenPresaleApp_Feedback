// SPDX-License-Identifier: None
pragma solidity ^0.8.30;

import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {IERC20} from "@openzeppelin/contracts/interfaces/IERC20.sol";
import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";


contract ELOToken is IERC20, IERC20Metadata, Ownable {
    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;
    bool public mintingFinishedPermanent = false;
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    address public _creator;
    
    uint256 _mintTimeStamp = block.timestamp;
    
    // Token distribution amount
    uint256 public _presaleAmount;
    uint256 public _stakingAmount;
    uint256 public _cexReseveredAmount;
    uint256 public _teamAmount;
    uint256 public _rewardAmount;
    uint256 public _dexAmount;
    uint256 public _customerAmount;
    uint256 public _airdropAmount;
    
    // Token distribution address
    address presaleAddress;
    address stakingAddress;
    address cexReservedAddress;
    address teamAddress;
    address rewardAddress;
    address dexAddress;
    address customerAddress;
    address airdropAddress;
    /**
     * @dev Sets the values for {name}, {symbol} and {decimals}.
     *
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor ()Ownable(msg.sender) {
        _name = "Effortless Order";
        _symbol = "ELO";
        _decimals = 18;
        _totalSupply = 100 * 10**7 * 10**18;
        
        _presaleAmount = 10 * 10**7 * 10**18;
        _dexAmount = 10 * 10**7 * 10**18;
        _cexReseveredAmount = 15 * 10**7 * 10**18;
        _stakingAmount = 25 * 10**7 * 10**18;
        _teamAmount = 10 * 10**7 * 10**18;
        _rewardAmount = 20 * 10**7 * 10**18;
        _customerAmount = 5 * 10**7 * 10 ** 18;
        _airdropAmount = 5 * 10**7 * 10**18;
        
        // Test address
        presaleAddress = 0xfb7343A0d097260b3f439cfd12e521a2f886D78E;
        dexAddress = 0xfb7343A0d097260b3f439cfd12e521a2f886D78E;
        cexReservedAddress = 0xfb7343A0d097260b3f439cfd12e521a2f886D78E;
        stakingAddress = 0xfb7343A0d097260b3f439cfd12e521a2f886D78E;
        teamAddress = 0xfb7343A0d097260b3f439cfd12e521a2f886D78E;
        rewardAddress = 0xfb7343A0d097260b3f439cfd12e521a2f886D78E;
        customerAddress = 0xfb7343A0d097260b3f439cfd12e521a2f886D78E;
        airdropAddress = 0xfb7343A0d097260b3f439cfd12e521a2f886D78E;

        // Real address
        // presaleAddress = ;
        // stakingAddress = ;
        // cexReservedAddress = ;
        // teamAddress = ;
        // incentiveAddress = ;
        // dexAddress = ;
        // airdropAddress = ; 

        require(_totalSupply == _presaleAmount + _stakingAmount + _cexReseveredAmount + _teamAmount + _rewardAmount + _dexAmount + _customerAmount + _airdropAmount, "BALCN");
        
        _mint(_msgSender(), _totalSupply);
        mintingFinishedPermanent = true;
        
        // Initial Send tokens
        transfer(presaleAddress, _presaleAmount);
        transfer(stakingAddress, _stakingAmount);
        transfer(cexReservedAddress, _cexReseveredAmount);
        transfer(dexAddress, _dexAmount);
        transfer(rewardAddress, _rewardAmount);
        transfer(customerAddress, _customerAmount);
        transfer(airdropAddress, _airdropAmount);
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(sender, _msgSender(), currentAllowance - amount);

        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        _approve(_msgSender(), spender, currentAllowance - subtractedValue);

        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(!mintingFinishedPermanent,"cant be minted anymore!");
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        //_totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    } 

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        _balances[account] = accountBalance - amount;
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual { }
}