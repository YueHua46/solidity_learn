// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

pragma solidity 0.8.20;

/**
 * Events 允许登录到以太坊区块链。事件的一些用例包括
 * 侦听事件和更新用户界面
 * 事件（Event）是一种在智能合约中记录信息的方式。
 * 当某些状态变量的值发生改变时，智能合约可以触发一个事件并将新的信息记录在区块链上。
 * 这些信息可以被前端应用程序捕获和处理，以便在用户界面上显示状态的更新
 */

contract Event {
  // 事件声明
 // 最多可以索引3个参数。
 // 索引参数可帮助您通过索引参数过滤日志
 event Log(address indexed sender,string message);
 event AutherLog();
 
 function test() public {
  emit Log(msg.sender,"Hello World");
  emit Log(msg.sender,"Hello EVM");
  emit AutherLog();
 }
}