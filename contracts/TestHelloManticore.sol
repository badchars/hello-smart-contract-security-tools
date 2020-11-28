pragma solidity ^0.6;

import "./HelloManticore.sol";

/*
echidna-test contracts/TestHelloManticore.sol --contract TestHelloManticore --config config/echidna/hello-manticore.yaml
*/
contract TestHelloManticore is HelloManticore {
    function test_add(uint a, uint b) external view returns (uint) {
        uint c = add(a, b);
        assert(c >= a);
        return c;
    }
}