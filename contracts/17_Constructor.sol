// SPDX-License-Identifier: MIT


/**
 * constructor 是在创建合约时执行的可选函数。
 */

contract X {
  string public name;
  constructor(string memory _name) {
    name = _name;
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
// 3. D
// 就算传递参数的顺序不同，但因继承顺序，始终是X调用，然后是Y调用
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}

