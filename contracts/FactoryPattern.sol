//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ComputerCompany{
    Desktop[] public desktop;
    function create() public {
        desktop.push(new Desktop());
    }
}

contract Desktop{

}