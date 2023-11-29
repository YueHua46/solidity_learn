// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

/**
 * 使用import关键字导入其他合约
 * 通过import关键字导入其他合约，可以在当前合约中使用被导入合约中的所有public函数和变量
 */

// 定义一个合约1，待会在合约2中导入它的foo函数
contract Solidity_1 {
  // 公开的函数，可被其他合约导入
  function foo() public pure returns(uint) {
    return 1;
  }
  // 私有的函数，不可被其他合约导入
  function bar() private pure returns(uint) {
    return 2;
  }
  // 公开的变量，可被其他合约导入
  uint public x = 10;
  // 私有的变量，不可被其他合约导入
  uint private y = 20;

  function store(uint _val) public {
    x = _val;
  }

  function getStore() public view returns(uint) {
    return x;
  }
}

