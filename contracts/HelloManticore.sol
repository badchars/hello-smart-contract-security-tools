pragma solidity ^0.6;

// manticore contracts/HelloManticore.sol
contract HelloManticore {
    function add(uint a, uint b) public pure returns (uint) {
        uint c = a + b;
        require(c >= a, "c < a");
        require(c >= b, "c < b");
        // c = a + b and c >= a and c >= b and (c < a or c < b)
        return c;
    }
}