// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and less than 0.9.0
pragma solidity ^0.8.20;

contract Constructor {
    //state variables to be assigned initial values within constrcutor
    // or cduring contract deployment.
    address public owner;
    string public name;
    uint public age;

    constructor(string memory _name, uint _age) {
        owner = msg.sender;
        name = _name;
        age = _age;
    }

    // create modifier for "admin" gatekeeping to only permit the owner
    // to make state changes i.e. change the name of "user" in this example
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        // this "_;" is a placeholder if you wish - basically means "run 
        // rest of the code if code passes basic secuirty check"
        _;
    }

    function changeName(string memory _newName) public onlyOwner {
        name = _newName;
    }
}