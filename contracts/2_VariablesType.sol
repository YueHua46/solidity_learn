// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

/**
 * 三种类型的变量
 *  1. local类型
 *    存储在函数中，在函数内部声明
 *  2. state类型
 *    存储在区块链上，在函数外部声明
 *  3. global类型
 *    存储有区块链的信息，例如：msg.sender、block.timestamp等
 */

contract VariablesType {
  // 函数外部的state变量
  string public text = "hello world";
  uint public num = 1;
  
  function doSomething() public view {
    // 函数内部的local变量
    string memory localText = "hello world";

    // 全局的global变量
    uint ts = block.timestamp;
    address sender = msg.sender;
  }
}