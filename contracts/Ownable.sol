pragma solidity ^0.6;

contract Ownable {
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "!owner");
        _;
    }

    function setOwner(address _owner) external onlyOwner {
        require(_owner != address(0), "owner = zero address");
        owner = _owner;
    }
}

So you could try to simplify the "BitVecConcat" thing and maybe you get a BitVecConstant and maybe the concrete value you can dig out of it is 1364763675461413210983545284569035401398040208581
from manticore.core.smtlib.visitors import simplify, translate_to_smtlib
...
theconcat = ABI.deserialize("address", tx.return_data)
theconcrete = 1364763675461413210983545284569035401398040208581
assert simplify(theconcat).value == theconcrete ??
But in a general way if something is an Expression then there could be some constraints in the path-constraints that affect it. So you can ask the solver if 2 values (potentially expressions) are the same thing.
theconcat = ABI.deserialize("address", tx.return_data)
theconcrete = 1364763675461413210983545284569035401398040208581
assert state.must_be_true(theconcat == theconcrete)? #validity. checks that can not be different.
(edited)
white_check_mark
eyes
raised_hands





12:18
(The api may be slightly different)