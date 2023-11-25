// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

contract Function {
  // 可以指定函数返回值类型
  function returnMany() public pure returns (uint,bool,uint) {
    return (1,true,2);
  }

  // 可以指定函数返回值命名和其类型
  function named() public pure returns (uint x,bool b,uint y) {
    return (1,true,2);
  }

  // 可以通过解构其他函数的返回值
  function destructuringAssignments () public pure returns (uint,bool,uint,uint,uint) {
    // 解构函数调用的返回值
    (uint x,bool b,uint y) = returnMany();

    // 值可以省略
    (uint i,,uint j) = (1,2,3); // i = 1，j = 3

    return (x,b,y,i,j);
  }
  
}