pragma solidity ^0.6;

import "./SafeMath.sol";

/*
echidna-test contracts/TestSafeMath.sol --contract TestSafeMath --config config/echidna/safe-math.yaml
*/

contract TestSafeMath {
    using SafeMath for uint;

    function test_add(uint a, uint b) public view returns (uint) {
        uint c = a.add(b);
        assert(c >= a);

        return c;
    }

    function test_sub(uint a, uint b) public view returns (uint) {
        uint c = a.sub(b);
        assert(c <= a);

        return c;
    }

    function test_mul(uint a, uint b) public view returns (uint) {
        uint c = a.mul(b);
        if (a > 0) {
            assert(c / a == b);
        } else {
            assert(c == 0);
        }

        return c;
    }

    function test_div(uint a, uint b) public view returns (uint) {
        uint c = a.div(b);
        assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }
}