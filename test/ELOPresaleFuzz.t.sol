// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import "forge-std/Test.sol";
import "../src/ELOPresale.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("MockToken", "MOCK") {
        _mint(msg.sender, 1e24);
    }
}

contract ELOPresaleFuzzTest is Test {
    ELOPresale presale;
    MockERC20 saleToken;
    address OWNER = address(0xA11CE);

    function setUp() public {
        saleToken = new MockERC20();
        vm.prank(OWNER);
        presale = new ELOPresale();
        saleToken.transfer(address(presale), 1e22);

        vm.prank(OWNER);
        presale.init_private(
            address(saleToken),
            1000,
            0.1 ether,
            5 ether,
            1 ether,
            50 ether,
            block.timestamp,
            block.timestamp + 2 days
        );
    }

    function testFuzzDeposit(uint256 amt) public {
        vm.assume(amt > 0.1 ether && amt < 5 ether);

        address user = address(uint160(uint256(keccak256(abi.encode(amt)))));
        vm.deal(user, amt);

        vm.prank(user);
        presale.userDeposit{value: amt}();

        (uint256 base,) = presale.buyers(user);
        assertEq(base, amt);
    }
}
