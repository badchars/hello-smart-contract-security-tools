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