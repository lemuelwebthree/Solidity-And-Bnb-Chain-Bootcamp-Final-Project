// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;


// intrefaces help developers declare function signatures
// of contract's public methods without providing implementation details.
// It allows for one to define a stand interface for other contracts to 
// interact with without exposing any implementation details
contract ContractA {
    uint public someValue;
    function setValue(uint newValue) external {
        someValue = newValue;
    }
}

interface ContractAInterface{
    function setValue(uint) external; // same signature with contractA's function
}

// Contract B
contract ContractB {

    //call setVallue function using address of contractA and Interface
    function setValueOnContractA(address _contractA, uint newValue) public {
        ContractAInterface(_contractA).setValue(newValue);
    }
}