pragma solidity ^0.5;

 contract Ownership{
    address owner = msg.sender;
    function Owner() public {
         owner = msg.sender;
     }
     modifier isOwner(){
         require(owner == msg.sender);
         _;
      }
   }

  contract Pausable is Ownership{
     bool is_paused;
     modifier ifNotPaused(){
              require(!is_paused);
              _;
      }

      function paused() isOwner public{
          is_paused = true;
      }

      function resume() isOwner public{
          is_paused = false;
      }
   }

   contract Token is Pausable{
      mapping(address => uint) public balances;
      function transfer(address to, uint value) ifNotPaused public{
           balances[msg.sender] -= value;
           balances[to] += value;
       }
   }

// Exercise
// Add a property to check that echidna_caller cannot have more than an initial
// balance of 10000.

contract TestToken is Token {
    address echidna_caller = 0x00a329C0648769a73afAC7F9381e08fb43DBEA70;

    constructor() public{
        balances[echidna_caller] = 10000;
    }

    function echidna_balance_under_10000() public view returns (bool) {
        return balances[echidna_caller] <= 10000;
    }
}