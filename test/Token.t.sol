// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import {Zenith} from "../src/Token.sol";

contract TokenTest is Test {
    Zenith public zenithToken;
    address internal rauhan;
    address internal joe;

    function setUp() public {
        zenithToken = new Zenith("ZenithToken", "ZTK");
        rauhan = address(1);
        joe = address(2);
        vm.label(rauhan, "Rauhan");
        vm.label(joe, "Joe");
    }

    function test_mint() public {
        zenithToken.mint(rauhan, 10 ether);
        assertEq(zenithToken.balanceOf(rauhan), 10 ether);
    }

    function test_name() public {
        assertEq(zenithToken.name(), "ZenithToken");
    }

    function test_symbol() public {
        assertEq(zenithToken.symbol(), "ZTK");
    }

    function test_transfer() public {
        zenithToken.transfer(joe, 20 ether);
        assertEq(zenithToken.balanceOf(joe), 20 ether);
    }
}
