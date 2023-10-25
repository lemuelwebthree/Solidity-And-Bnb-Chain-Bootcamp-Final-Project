// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and less than 0.9.0
pragma solidity ^0.8.20;

contract HelloWorld {
    // stat variables automatically get a getter functions for reads
    string public text = "Hello World";

    function getText() public view returns (string memory) {
        return text;
    }
}