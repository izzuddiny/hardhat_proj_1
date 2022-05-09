//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Assert {
    uint balance;

    function deposit(uint _amount) public {
        balance +=_amount;
        assert(balance <= 100);
    }

}