//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Company {
    mapping(string=>address) public register;

    function contractCall() public {
        register["CEO"] = address(new CEO());
        register["HR"]  = address(new HR());
        register["Manager"] = address(new Manager());
        //register["HR"].A();
    }

}

contract HR{
    //A() public {}
}

contract CEO{

}

contract Manager{

}