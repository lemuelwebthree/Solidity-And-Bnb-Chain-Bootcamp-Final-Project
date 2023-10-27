// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

contract ModifierExample {
    address public owner;
    uint public myNumber;

    constructor(uint _myNumber) {
        owner = msg.sender;
        myNumber = _myNumber;
    }

    // modifier is an automatic condition checker that can added
    // into function signature.
    // Modifiers can be created with parameters or not.
    // if conditions are met then the function will execute.
    // think of modifiers as function-execution gatekeeper used
    // to create "permissioned" function sin solidity. Makes sense?
    // Great!
    modifier onlyOwnerOrAddress(address _allowedAddress) {
        require(msg.sender == owner || msg.sender == _allowedAddress, "Only owner or allowed address can call this function");
        // _; is called a merge wildcard whih is replace by the function
        // definition during function execution.
        // merge wildcards are required for all modifiers
        _;
    }

    function changeNumber(uint _newNumber) public onlyOwnerOrAddress(address(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2)) {
        myNumber = _newNumber;
    }
}