pragma solidity ^0.6;

import "./Simple.sol";

// echidna-test contracts/TestSimple.sol --contract TestSimple
contract TestSimple is Simple {
    function echidna_test_x() external view returns (bool) {
        return x == 123;
    }
}