pragma solidity ^0.6;

contract ERC20{

    event Transfer(address indexed,address,uint256);

    function transfer(address, uint256) public{

        emit Transfer(msg.sender,msg.sender,0);
    }

}