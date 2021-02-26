pragma solidity ^0.6;

import "./ERC20.sol";

contract TestERC20 is ERC20 {
    constructor () public ERC20("TestERC20", "TEST") {
        _mint(msg.sender, 10000);
    }

    // manticore-verifier
    // manticore-verifier contracts/TestERC20.sol --contract TestERC20
    function crytic_test_balance() view external returns (bool) {
        return _balances[msg.sender] <= 10000;
    }
}