// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

import "./Libraries.sol";

contract ImportedLibraryExample {
    uint[] myNumbers = [1,2,3,4,5];

    // libraries can only be pure or view functions
    function doubleMyNumbers() public view returns (uint[] memory) {
        // calling the double method from MyLibrary to be acted
        // on array of myNumbers so each elements get doubled
        // so it will create new instance of the array data set
        // myNumbers by doubling each element.
        return MyLibrary.double(myNumbers);
    }
}