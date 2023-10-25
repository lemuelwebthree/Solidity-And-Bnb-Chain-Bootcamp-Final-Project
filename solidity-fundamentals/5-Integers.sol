// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Integers {
    // uint and int variable sdefault to 0 if uninitialised
    // unit = unint256 & int = int256
    uint public number;

    int public anotherNumber;

    function setNumber(uint newNumber) public {
        number = newNumber;
    }

    function setAnotherNumber(int newAnotherNumber) public {
        anotherNumber = newAnotherNumber;
    }

    function sum() public view returns (int) {
        return anotherNumber + 7;
    }
}
