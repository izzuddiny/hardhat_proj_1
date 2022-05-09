//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function transfer(address to, uint tokens) external returns (bool success);

    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract Block is ERC20Interface{
    string public name="Block"; //name of the token
    string public symbol="BLK";

    string public decimal="0";
    uint public override totalSupply;
    address public founder;
    mapping(address=>uint) public balances;
    mapping(address=>mapping(address=>uint)) allowed;

    constructor(){
        totalSupply=100000;
        founder=msg.sender;
        balances[founder]=totalSupply;
    }

    function balanceOf(address tokenOwner) public view override returns(uint balance){
        return balances[tokenOwner];
    }

    function transfer(address to, uint tokens) public override returns(bool success){
        require(balances[msg.sender]>=tokens);
        balances[to]+=tokens; //balances[to] + tokens
        balances[msg.sender]-= tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) public override returns(bool success){
        require(balances[msg.sender] >= tokens);
        require(tokens> 0);
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function allowance(address tokenOwner, address spender) public view override returns(uint noOfTokens){
        return allowed[tokenOwner][spender];
    }

    function transferFrom(address from, address to, uint tokens) public override returns(bool success){
        require(allowed[from][to]>=tokens);
        require(balances[from]>=tokens);
        balances[from] -= tokens;
        balances[to]+= tokens;
        return true;
    }

}

contract ICO is Block {

    address public manager;
    address payable public deposit;

    uint tokenPrice = 0.1 ether;
    uint public cap = 300 ether;

    uint public raisedAmount;

    uint public icoStart=block.timestamp;
    uint public icoEnd=block.timestamp+3600; // 1 hour

    uint public tokenTradeTime = icoEnd+3600;

    uint public maxInvest = 10 ether;
    uint public minInvest = 0.1 ether;

    enum  State{beforeStart, afterEnd, running, halted}

    State public icoState;

    event Invest(address investor, uint value, uint token);

}