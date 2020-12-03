pragma solidity ^0.6.0;


interface Building {
  function isLastFloor(uint) external returns (bool);
}

/*
This elevator won't let you reach the top of your building. Right?
*/

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}