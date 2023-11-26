// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

contract EtherUnits {
  uint public oneWei = 1 wei;
  // 1 wei 等于 1
  // 1 wei 等于 10^9 gwei
  bool public isOonWei = 1 wei == 1;
  uint public oneEther = 1 ether;
  // 1 eth 等于 10^18 wei
  bool public isOneEther = 1 ether == 1e18;
}