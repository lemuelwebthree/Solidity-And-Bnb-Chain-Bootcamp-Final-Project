// SPDX-License-Identifier: MIT
// compiler version has to be greater than or equal (>=) to 0.8.20 and less than 0.9.0
pragma solidity ^0.8.20;

contract HelloWorld {
    // state variables automatically get a getter functions for reads
    // if their visibility modifier is set to public
    string public text = "Hello World";

    function getText() public view returns (string memory) {
        return text;
    }
}
