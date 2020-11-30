pragma solidity ^0.6.0;

import "./contract.sol";

contract Test is Fallout {
    /*
    Claim ownership of the contract below to complete this level.
    */

    function echidna_test_owner() public view returns (bool) {
        return owner == address(0) || owner == msg.sender;
    }
}