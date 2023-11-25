// SPDX-License-Identifier: MIT

contract FunctionModifier {
  address public owner;
  uint public x = 10;
  bool public locked;

  constructor () {
    owner = msg.sender;
  }

  // 修饰符函数，用于修饰指定函数
  modifier onlyOwner() {
    require(msg.sender == owner,"Not owner");
    // _ 占位（表示next，下一个修饰符或函数内容则会被替换到该处执行）
    _;
  }

  // 修饰符函数可以接收参数，通常这能够接受到指定函数调用时得参数
  modifier validAddress(address _addr) {
    // 检查地址参数是否不为“零地址”（通常在以太坊中表示一个空地址），如果为0地址则出错
    require(_addr != address(0),"Not valid address");
    _;
  }

  function changeOwner (address _newOwner) public onlyOwner validAddress(_newOwner) {
    owner = _newOwner;
  }

  // 修饰符可以在函数之前和/或之后调用。
  // 防止重入攻击example（加锁）
  modifier noReentrancy() {
    // 要求locked为false，否则报错
    require(!locked,"No Reentrancy!");
    locked = true;
    _;
    locked = false;
  }

  function decrement(uint i) public noReentrancy {
    x -= i;
    if(i > 1) {
      decrement(i - 1);
    }
  }
}