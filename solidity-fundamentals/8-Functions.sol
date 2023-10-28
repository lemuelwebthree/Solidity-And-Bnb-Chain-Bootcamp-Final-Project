// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

contract Functions {
    // corresponding getter function generated automatically for public
    // state variables
    string public stateString = "Hello World";

    // public view function - read data from blockchain without changing its state
    // read only funciton basically.
    // no writes and modications can be performed on concerning blockkchain
    function viewExample() public view returns (string memory) {
        return stateString;
    }

    // pure functions are similar to view fucntions in a way
    // but they are more restricted. Does not interact with blockchain directly
    // and it allows us to perfrom arbitary calculcations as an example
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}