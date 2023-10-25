// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Booleans {
    // uninitialised (i.e. bool public unhappy; defaults to false)
    // boolean variables default to false
    // access modifier set to public
    bool public isOwner;

    function getVar() public view returns (bool) {
        return isOwner;
    }

    function setVar(bool newValue) public {
        isOwner = newValue;
    }
}
