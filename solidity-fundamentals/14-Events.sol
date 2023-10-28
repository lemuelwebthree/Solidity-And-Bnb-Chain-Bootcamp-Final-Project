// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and
// less than 0.9.0
pragma solidity ^0.8.20;

// events help us nto notify external parties about state changes within
// asmart contract. evnts get activated or trigger emit.
// When events are emitted, they are added to a log entry in the transaction rceipt,
// which can be read by external applications and used to triggger further actions
contract Events {
    event NewTransaction(uint indexed transactionId, address indexed sender, address indexed recipient, uint amount);

    function transfer(address recipient, uint amount)  public {
        // perform transfer logic
        require(amount >= 400, "The amount is less than expected");
        uint transactionId = 1234;
        emit NewTransaction(transactionId, msg.sender, recipient, amount);
    }
}