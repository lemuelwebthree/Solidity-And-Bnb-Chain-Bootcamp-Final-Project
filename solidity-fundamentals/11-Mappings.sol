// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

contract Mappings {
    // nams mapping - mapping address keys to value names
    // use public access modifier to auot-geerate respctive getter
    // note that the types for mapping keys can only be built in types - however
    // related values of key-value pairs can be custom data types like a Struct
    // of perosn details (name and age) to store in a mapping called friends list.

    // NOTES ON DOUBLE MAPPINGS OR NESTED MAPPINGS OR HASHMAPS
    // Nested mapping are not really gas efficient but they ar efor complex
    // dtata types however they are not iterable

    // CREATE
    mapping(address => string) public names;
    // READ
    function getName() public view returns (string memory) {
        return names[msg.sender];
    }
    // UPDATE
    function setName(string memory _name) public {
        names[msg.sender] = _name;
    }
    // DELETE
    function deleteMappingKV() public {
        delete names[msg.sender];
    }
}