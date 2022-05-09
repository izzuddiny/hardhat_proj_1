//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Revert{
    uint balance = 10;
    uint a=0;

    function callMe(uint _amount) public returns(uint) {
        a=5;

        //require(balance > _amount, "Balance is less than the amount");
        // return balance;

        if(balance > _amount){
            return balance;
        }else{
            revert("Balance is less than the amount");
        }
    }

    function callA() public view returns(uint){
        return a;
    }

}