// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

/**
 * solidity支持for和while这类loop循环语句
 */

contract Loop {
  function loop (uint x) public pure returns(uint) {
    // for循环语句
    for (uint i = 0; i < x; i++) {
      if(i == 3) {
        continue;
      } else if (i == 5) {
        break;
      }
    }

    uint j;
    // while循环语句
    while(j < 10) {
      j++;
    }
    return j;
  }
}