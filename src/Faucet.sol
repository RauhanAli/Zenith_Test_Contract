// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {Zenith} from "./Token.sol";

contract Faucet is Ownable {
    mapping(address => uint256) userNextMintTime;
    uint256 private mintTimeLimit;
    Zenith private zenithToken;

    constructor(address token, uint256 _mintTimeLimit) Ownable(msg.sender) {
        zenithToken = Zenith(token);
        mintTimeLimit = _mintTimeLimit;
    }

    function requestTokens() public {
        require(msg.sender != address(0), "Cannot send token zero address");
        require(
            block.timestamp > userNextMintTime[msg.sender],
            "Your request time is not completed"
        );
        require(
            zenithToken.transfer(msg.sender, 7 ether),
            "requestTokens(): Failed to Transfer"
        );
        userNextMintTime[msg.sender] = block.timestamp + mintTimeLimit;
    }

    function getMintLimitTime() public view returns (uint256) {
        return mintTimeLimit;
    }

    function getNextMintTime() public view returns (uint256) {
        return userNextMintTime[msg.sender];
    }
}
