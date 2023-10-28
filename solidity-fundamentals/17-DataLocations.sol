// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

contract Example {
    uint storedData;// stored in storage
    string storedString; // stored in storage

    function set(uint x, string calldata s) public {
        storedData = x; // set value in storage
        storedString = s; // set string value in storage
    }

    function get() public view returns (uint, string memory) {
        return (storedData, storedString); // read from storage
    }

    function double(uint[] calldata nums) public pure returns (uint[] memory) {
        uint[] memory result = new uint[](nums.length);

        for (uint i = 0; i < nums.length; i++) {
            result[i] = nums[i] * 2; // stored in memory
        }

        return result; // returned from memory
    }
}