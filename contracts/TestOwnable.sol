pragma solidity ^0.6;

import "./Ownable.sol";

contract TestOwnable is Ownable {
    function echidna_test_true() external view returns (bool) {
        return owner != address(0);
    }
}