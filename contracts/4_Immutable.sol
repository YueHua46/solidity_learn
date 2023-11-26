// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

/**
 * 使用immutable关键字声明不可变变量
 * 和constant关键字不同，immutable变量可以在构造函数中初始化
 * 目前string并不支持immutable
 */

contract Immutable {
  // 未初始化的不可变变量，可通过构造函数初始化
  address public immutable MY_ADDR;
  // 初始化后的不可变变量
  uint public immutable BLOCK_TS = block.timestamp;

  constructor(address _MY_ADDR) {
    MY_ADDR = _MY_ADDR;
  }
}