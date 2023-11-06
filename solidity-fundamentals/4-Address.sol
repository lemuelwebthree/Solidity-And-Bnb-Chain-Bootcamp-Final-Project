// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Address {
    // getter function will not be automatically generated for 
    // private state variables
    // use msg.sender ( a global variable) to get owner address instead of hardcoding it
    address private owner = msg.sender;

    function getOwner() public view returns(address) {
        return owner;
    }
}
