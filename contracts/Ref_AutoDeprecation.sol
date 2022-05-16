// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ref_AutoDeprecation {

    uint SOME_BLOCK_NUMBER = 100;
    modifier isActive(){
        require(block.number <= SOME_BLOCK_NUMBER);
        _;
    }

    // can only deposit before SOME_BLOCK_NUMBER
    function deposit() public isActive {
        // some code
    }

    function withdraw() public {
        // some code
    }
}