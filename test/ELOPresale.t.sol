// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import "forge-std/Test.sol";
import "../src/ELOPresale.sol";
import "../src/TransferHelper.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("MockToken", "MOCK") {
        _mint(msg.sender, 1e24);
    }
}

contract ELOPresaleTest is Test {
    ELOPresale presale;
    MockERC20 saleToken;
    address OWNER = address(0xA11CE);
    address USER1 = address(0xBEEF);
    address USER2 = address(0xCAFE);

    function setUp() public {
        vm.startPrank(OWNER);

        saleToken = new MockERC20();

        presale = new ELOPresale();

        saleToken.transfer(address(presale), 1e22);

        presale.init_private(
            address(saleToken),
            1000,     // rate
            1 ether,  // min
            5 ether,  // max
            10 ether, // softcap
            20 ether, // hardcap
            block.timestamp,
            block.timestamp + 3 days
        );

        vm.stopPrank();
    }

    function testInitValues() public view {
        (,uint256 token_rate,,,,,,) = presale.presale_info();
        (,,,uint256 decimal) = presale.tokeninfo();
        assertEq(token_rate, 1000);
        assertEq(decimal, saleToken.decimals());
    }

    function testDeposit() public {
        vm.deal(USER1, 10 ether);
        vm.prank(USER1);

        presale.userDeposit{value: 2 ether}();

        (uint256 base, uint256 sale) = presale.buyers(USER1);
        assertEq(base, 2 ether);
        assertEq(sale, 2000 ether);
    }

    function testFailDepositBeforeStart() public {
        vm.warp(block.timestamp - 100);
        vm.deal(USER1, 2 ether);

        vm.prank(USER1);
        presale.userDeposit{value: 1 ether}(); // revert expected
    }

    function testWithdrawTokensAfterSuccess() public {
        vm.deal(USER1, 20 ether);
        vm.prank(USER1);
        presale.userDeposit{value: 10 ether}();

        vm.warp(block.timestamp + 4 days); // presale ended

        vm.prank(USER1);
        presale.userWithdrawTokens();

        (uint256 base, uint256 sale) = presale.buyers(USER1);
        assertEq(base, 0);
        assertEq(sale, 0);
    }

    function testRefundOnFailure() public {
        vm.deal(USER1, 5 ether);
        vm.prank(USER1);
        presale.userDeposit{value: 5 ether}();

        vm.warp(block.timestamp + 4 days); // expired but softcap not reached

        uint256 before = USER1.balance;
        vm.prank(USER1);
        presale.userWithdrawBaseTokens();

        uint256 afterBal = USER1.balance;
        assertEq(afterBal, before + 5 ether);
    }
}
