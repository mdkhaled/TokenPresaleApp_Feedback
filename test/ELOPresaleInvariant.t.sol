// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import "forge-std/Test.sol";
import "forge-std/StdInvariant.sol";
import "../src/ELOPresale.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import {Vm} from "forge-std/Vm.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("MockToken", "MOCK") {
        _mint(msg.sender, 1e24);
    }
}

contract Handler {
    ELOPresale public presale;

    constructor(ELOPresale _presale) {
        presale = _presale;
    }

    function deposit(Vm vm,uint256 amt) public {
        vm.assume(amt > 0 && amt < 5 ether);
        vm.deal(msg.sender, amt);
        presale.userDeposit{value: amt}();
    }
}

contract ELOPresaleInvariantTest is StdInvariant {
    ELOPresale presale;
    MockERC20 saleToken;
    Handler handler;

    function setUp() public {
        saleToken = new MockERC20();

        presale = new ELOPresale();
        saleToken.transfer(address(presale), 1e22);

        presale.init_private(
            address(saleToken),
            1000,
            1,
            5 ether,
            10 ether,
            50 ether,
            block.timestamp,
            block.timestamp + 100 days
        );

        handler = new Handler(presale);

        targetContract(address(handler));
    }

    function invariant_RaisedAmountMatchesUserDeposits() public {
        uint256 total;
        (,uint256 raised_amount,uint256 sold_amount,,,)=presale.status();
        for (uint256 i = 0; i < 20; i++) {
            address user = address(uint160(i));
            (uint256 base,) = presale.buyers(user);
            total += base;
        }
        assert(raised_amount == total);
    }

    function invariant_SoldAmountMatchesRate() public {
        (,uint256 raised_amount,uint256 sold_amount,,,)=presale.status();
        (,uint256 token_rate,,,,,,) = presale.presale_info();
        assert(
            sold_amount==
            raised_amount * token_rate)
        ;
    }
}
