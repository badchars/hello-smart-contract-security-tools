pragma solidity ^0.7;

contract ArrayShift {
    uint[] arr;
    // copy of arr for test
    uint[] copy;

    function add(uint x) public {
        arr.push(x);
    }

    function remove(uint i) public {
        require(i < arr.length, "i > len");

        // shift elements to the left by one
        if (arr.length > 1) {
            /*
            if i == arr.length - 1
                then pop last element
            if i < arr.length - 1
                shift elements to the left by one
                pop last element
            */
            for (uint j = i; j < arr.length - 1; j++) {
                arr[j] = arr[j + 1];
            }
        }
        arr.pop();
    }

    // echidna test //
    /*
    echidna-test contracts/echidna/ArrayShift.sol --config config/echidna/assert.yaml
    */
    function test_remove(uint i) public {
        require(i < arr.length, "i > len");

        // reset copy
        delete copy;

        uint len = arr.length;
        // copy elements except ith element
        for (uint j = 0; j < arr.length; j++) {
            if (j != i) {
                copy.push(arr[j]);
            }
        }

        remove(i);

        assert(arr.length == len - 1);
        for (uint j = 0; j < arr.length; j++) {
            assert(arr[j] == copy[j]);
        }
    }
}