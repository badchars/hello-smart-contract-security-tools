pragma solidity ^0.6.0;

import "./contract.sol";

contract Test is Token {
    constructor() Token(20) public {}

    function echidna_test_balance() public view returns (bool) {
        return balances[msg.sender] <= 20;
    }
}