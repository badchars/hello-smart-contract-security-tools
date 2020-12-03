pragma solidity ^0.6.0;

import "./contract.sol";

contract Test is CoinFlip {
    function echidna_test_coin_flip() public view returns (bool) {
        return consecutiveWins < 10;
    }
}