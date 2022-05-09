//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract WithdrawalPattern{
    address payable richest;
    mapping(address=>uint) investors;
    uint max;

    constructor() payable{
        richest = payable(msg.sender);
        max = msg.value;
        richest.transfer(msg.value);
    }

    function sendEther() payable public {
        require(msg.value > max, "You are not the richest");
        richest = payable(msg.sender);
        max = msg.value;
        //richest.transfer(msg.value); // Separate the withdraw
        investors[msg.sender] = msg.value;
    }

    function withdraw() public {
        uint amount = investors[msg.sender];
        investors[msg.sender] = 0;
        richest.transfer(amount);
    }
}