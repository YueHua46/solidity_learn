// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * 当前合约主要演示以下内容：
 * 1. 构造函数
 * 2. 继承
 * 3. 重写
 */

contract X {
  string public name;
  uint public age;
  constructor(string memory _name) {
    name = _name;
  }
  // 为了让store函数能被子合约重写，需要加上virtual关键词
  
  function setName(string memory _name) public virtual {
    name = _name;
  }

  function setAge(uint _age) public virtual {
    age = _age;
  }
}

contract Y {
  string public text;
  constructor(string memory _text) {
    text = _text;
  }
}

// is关键词是用于继承，效果类似java的extends，可在继承阶段调用构造并初始化参数
contract B is X("Input to X"),Y("Input to Y") {}

// 也可在constructor阶段调用构造并初始化参数，在这里可以使用C构造函数调用时传递的参数来初始化
contract C is X,Y {
  constructor(string memory _name,string memory _text) X(_name) Y(_text) {}
}

// 父构造函数总是按照继承的顺序调用 
// 无论子合约的构造函数中列出的父合约的顺序如何。
// 如下合约中，构造函数调用顺序：
// 1. X
// 2. Y
// 3. D
contract D is X,Y {
  constructor() X("X was called") Y("Y was called") {
  }
}
// 如下合约中，构造函数调用顺序：
// 1. X
// 2. Y
// 3. E
// 就算传递参数的顺序不同，但因继承顺序，始终是X调用，然后是Y调用
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}


// 可以通过override来重写父合约
contract F is X {
  constructor() X("Y was called") {}
  // 重写父合约的setAge函数，在函数修饰符中加入override关键字
  function setAge(uint _age) public override {
    age = _age + 5;
  }
}

