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

   contract MintableToken is Token{
      int totalMinted;
      int totalMintable;

      constructor(int _totalMintable) public {
         totalMintable = _totalMintable;
      }

      function mint(uint value) isOwner() public{
          require(int(value) + totalMinted < totalMintable);
          totalMinted += int(value);
          balances[msg.sender] += value;
       }
    }

// Exercise
/*
Add a property to check if echidna_caller cannot mint more than 10,000 tokens.
*/
    contract TestMintableToken is MintableToken {
        address echidna_caller = 0x00a329C0648769a73afAC7F9381e08fb43DBEA70;
        constructor() MintableToken(10000) public {
            owner = echidna_caller;
        }

        function echidna_total_mintable() public view returns (bool) {
            // return totalMinted <= 10000;
            return balances[msg.sender] <= 10000;
        }


    }