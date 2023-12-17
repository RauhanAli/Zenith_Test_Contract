// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/forge-std/src/Test.sol";
import {Zenith} from "../src/Token.sol";
import {Faucet} from "../src/Faucet.sol";

contract FaucetTest is Test {
    Zenith public zenithToken;
    Faucet public faucet;
    address internal rauhan;
    address internal joe;

    function setUp() public {
        zenithToken = new Zenith("ZenithToken", "ZTK");
        faucet = new Faucet(address(zenithToken), 10800);
        rauhan = address(1);
        joe = address(2);
        vm.label(rauhan, "Rauhan");
        vm.label(joe, "Joe");
    }

    function test_requestTokens() public {
        zenithToken.transfer(address(faucet), 70 ether);
        assertEq(zenithToken.balanceOf(address(faucet)), 70 ether);
        vm.startPrank(rauhan);
        faucet.requestTokens();
        assertEq(zenithToken.balanceOf(rauhan), 7 ether);
        uint256 mintTime = faucet.getMintLimitTime();
        uint256 NextMintTime = faucet.getNextMintTime();
        uint256 expectedNextTime = mintTime + block.timestamp;
        assertApproxEqRel(expectedNextTime, NextMintTime, 0.4e18);
        vm.stopPrank();
    }
}
