// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

// Multi-level inheritance
// each derived contract adds functionality to the ne inherited contract

contract ParentA {
    function foo() public pure returns (string memory) {
        return "ParentA";
    }  
}

contract ChildA is ParentA {
    function bar() public pure returns (string memory) {
        return "ChildA";
    }  
}


// Because contract ChildA inherits from ParentA, GrandChildA inherits from both
// contract ChildA And ParentA 
contract GrandChildA is ChildA {
    function baz() public pure returns (string memory) {
        return "GrandChildA";
    }  
}


// Hierarchical inheritance
// each derived contract adds functionality to the ne inherited contract

contract ParentC {
    function fooA() public pure returns (string memory) {
        return "ParentA";
    }  
}

// ChildB inherits from ParentC
contract ChildB is ParentC {
    function barA() public pure returns (string memory) {
        return "ChildA";
    }  
}


// Just like ChildB, ChildC  also inherits from ParentC
contract ChildC is ParentC {
    function bazA() public pure returns (string memory) {
        return "GrandChildA";
    } 
} 

    // Multiple inheritance
// each derived contract adds functionality to the ne inherited contract

contract ParentD {
    function fooB() public pure returns (string memory) {
        return "ParentA";
    }  
}

contract ParentE {
    function fooC() public pure returns (string memory) {
        return "ParentA";
    }  
}

contract ParentF {
    function barB() public pure returns (string memory) {
        return "ChildA";
    }  
}


// A single child contract combines functionality of multple contract by inheriting from
// multiple contract sourcs intoa single contract.
contract ChildD is ParentD, ParentE, ParentF {
    function bazb() public pure returns (string memory) {
        return "GrandChildA";
    }  
}