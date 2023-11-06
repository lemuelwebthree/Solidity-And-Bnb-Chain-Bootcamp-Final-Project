// SPDX-License-Identifier: MIT
// compiler version has to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

// libraries can be used on pure and view functions to reuse code time and time again
// by importing the library and making use of a specific function or set of functions
// that get used frequently. You can have a library for concatenations 
library MyLibrary {
    function double(uint[] memory nums) public pure returns(uint[] memory) {
        uint[] memory result = new uint[](nums.length);

        for (uint i = 0; i < nums.length; i++) {
            result[i] = nums[i] * 2;
        }

        return result;
    }
}
