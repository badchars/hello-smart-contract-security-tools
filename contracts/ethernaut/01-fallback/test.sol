pragma solidity ^0.6.0;

import './contract.sol';

/*
echidna-test contracts/ethernaut/01-fallback/test.sol --contract Test --config contracts/ethernaut/01-fallback/config.yaml
*/
contract Test is Fallback {
  constructor() Fallback() public payable { }

  /*
  claim ownership of the contract
  reduce its balance to 0
  */

  function echidna_test_owner() public returns (bool) {
    return owner == msg.sender;
  }

  function echidna_test_balance() public returns (bool) {
    return address(this).balance >= 1000;
  }
}