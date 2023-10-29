// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and less than 0.9.0
pragma solidity ^0.8.20;

// a call refers to the prcoess of executing a function of another contract
// from within the current contract. Calls are one of the mechnisms for contract
// interaction. Calls are commonly used for accessing data or functionality from
// otehr contracts
contract ContractA {
    uint someValue;
    function setValue(uint newValue) public {
        someValue = newValue;
    }
}

//
contract ContractB {

    // call setValue function using address of contractA.
    function setValueOnContractA(address _contractA, uint _newValue) public {
        _contractA.call(abi.encodeWithSignature("setValue(uint256)", 123));
    }
}