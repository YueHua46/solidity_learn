// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

/**
 * solidity 支持if else if以及else语句，也包括三元运算符
 */

contract IfElse {

  function foo(uint x) public pure returns(uint) {
    // 基础条件分支语句
    if(x < 10) {
      return 0;
    } else if(x < 20){
      return 1;
    } else {
      return 2;
    }
  }

  function ternary(uint _x) public pure returns(uint) {
    // 三元运算符
    return _x < 10 ? 0 : _x < 20 ? 1 : 2;
  }
}