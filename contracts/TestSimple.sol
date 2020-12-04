pragma solidity ^0.6;

import "./Simple.sol";

contract TestSimple is Simple {
    /*
    echidna-test contracts/TestSimple.sol --contract TestSimple
    */
    function echidna_test_x() external view returns (bool) {
        return x == 123;
    }

    /*
    manticore-verifier contracts/TestSimple.sol --name TestSimple
    */
    // function crytic_test_x() external view returns (bool) {
    //     return x == 123;
    // }
}