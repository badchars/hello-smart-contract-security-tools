pragma solidity ^0.7;

contract Array {
    uint[] arr;

    function add(uint x) public {
        arr.push(x);
    }

    function remove(uint i) public {
        require(i < arr.length, "i > len");

        arr[i] = arr[arr.length - 1];
        arr.pop();
    }

    // echidna test //
    /*
    echidna-test contracts/echidna/Array.sol --config config/echidna/assert.yaml 
    */
    function test_remove(uint i) public {
        require(i < arr.length, "i > len");

        uint len = arr.length;
        uint last = arr[arr.length - 1];

        remove(i);

        assert(arr.length == len - 1);
        // removing element != last
        if (i < len - 1) {
            assert(arr[i] == last);
        }
    }
}