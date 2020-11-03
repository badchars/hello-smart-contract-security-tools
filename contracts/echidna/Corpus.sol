pragma solidity ^0.5;

contract Corpus {
  bool value_found = false;
  function magic(uint magic_1, uint magic_2, uint magic_3, uint magic_4) public {
    require(magic_1 == 42);
    require(magic_2 == 129);
    require(magic_3 == magic_4+333);
    value_found = true;
    return;
  }

    //  find certain values to change a state variable.
  function echidna_magic_values() public returns (bool) {
    return !value_found;
  }

}