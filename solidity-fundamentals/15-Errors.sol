// SPDX-License-Identifier: MIT
// compiler version has to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

contract Errors {
    uint storedData;

    function set(uint x) public {
        require(x != 0, "cannot input zero as a value for x"); // require statement to check input
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }

    function add(uint a, uint b) public pure returns (uint) {
        uint result = a + b;
        if (result < a || result < b) {
            revert("result overflowed"); // revert statement to handle overflow
        }
        return result;
    }

    function divide(uint x, uint y) public pure returns (uint) {
        assert(y != 0); // assert statement to ensure that the numerator is not divide by zero
        return x/y;
    }
}
