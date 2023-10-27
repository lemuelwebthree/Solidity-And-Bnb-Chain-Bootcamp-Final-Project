// SPDX-License-Identifier: MIT
// compiler version mhas to be greater than or equal (>=) to 0.8.20 and 
// less than 0.9.0
pragma solidity ^0.8.20;

contract ControlStructures {
    // pure function ss i si not reliant on state variables to
    /// perform any calculations or transformations.
    function IfElse(uint x) public pure returns(uint) {
        if(x >= 77) {
            return x + 7;
        }

        else {
            return x - 7;
        }
    }

    function IfElseGasEfficient(uint x) public pure returns(uint) {
        if(x >= 77) {
            return x + 7;
        }
        // note hat code below is the same as:   else {
        //     return x - 5;
        // }
        return x - 7;
    }

    function forLoop(uint stop) public pure returns(uint) {
        uint sum = 0;

        for(uint i = 0; i<14; i++) {
            // sum = sum + 1 = sum += 1
            sum += i;
            // stop the loop when i reaches the "stop-th" iteration
            if (stop == i) {
                break;
            }
        }
        return sum;
    }

    function whileLoop(uint number) public pure returns(uint) {
        uint count =0;
        while (number != 0){
            // increment count by 1
            count ++;
            //decrement number by 1
            number --;
        }
        return count;
    }
}