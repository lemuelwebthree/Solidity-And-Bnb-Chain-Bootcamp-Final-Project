// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

contract Structs {

    // custom datat ytpe - a Struct for User details schema
    struct User {
        string name;
        uint age;
        address wallet;
    }  

    // A an array for storing the custom datat type (struct) User.
    // Arrays in oslidity are used to dat of the same data types only.
    // Struct array:
    User[] public user;

    function doOperations() external {
        // different ways of creating "Users" according to the schema of the User struct
        User memory User1 = User("Solomon Web3", 34, msg.sender);
        User memory User2 = User({name:"Bob", age:28, wallet: msg.sender});
        User memory User3;
        User3.name = "Alice";
        User3.age = 28;
        User3.wallet = msg.sender;

        // Adding "Users" to user array: User index 0 of array, User2, index 1, User3 index 2.
        user.push(User1);
        user.push(User2);
        user.push(User3);
    }
}