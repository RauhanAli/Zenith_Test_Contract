// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract Zenith is ERC20, Ownable {
    constructor(
        string memory name,
        string memory symbol
    ) ERC20(name, symbol) Ownable(msg.sender) {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Function to mint new tokens, only accessible by the contract owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
