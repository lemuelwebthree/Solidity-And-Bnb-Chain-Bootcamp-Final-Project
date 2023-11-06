// SPDX-License-Identifier: MIT
// compiler version has to be greater than or equal (>=) to 0.8.20 and
// less than 0.9.0
pragma solidity ^0.8.20;

contract StringsAndBytes {
    // public state variables get getter functions generated automatically
    string public greeting = "Hello, World";

    // the bytes value that is not in human readable format:
    // it can look like this for instance - 0x48656c6c6f2c20576f726c64
    bytes public helloText = "Hello, World";

    // however, bytes types can be casted or converted to string type
    // as shown below
    string public anotherString = string(helloText);
}
