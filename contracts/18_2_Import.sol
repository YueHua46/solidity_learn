// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

// 引入Solidity_1合约
import "./18_1_Import.sol";

contract Solidity_2 {

  Solidity_1[] public simpleStorageArray;

  function createSimpleContract() public {
    // 创建Solidity_1合约的实例
    Solidity_1 solidity = new Solidity_1();
    // 调用Solidity_1合约的foo函数
    solidity.foo();

    // 将Solidity_1合约的实例添加到数组中
    // 在Solidity中，当你将一个合约实例添加到数组中时，你实际上是将合约的地址添加到数组中，而不是合约实例本身
    // 所以实际使用时，你通过索引访问到的是一个地址，你需要将这个地址转换为合约实例，才能调用合约的函数
    simpleStorageArray.push(solidity);
  }

  // 当我们将Solidity_1合约的实例添加到数组中时，我们可以通过数组索引访问它
  function testSimpleStorage(uint _simpleStorageIndex) public view {
    // 处理数组索引越界
    uint length = simpleStorageArray.length;
    require(_simpleStorageIndex < length,unicode"数组索引越界");
    // 通过数组索引访问Solidity_1合约的实例
    Solidity_1 ssa = simpleStorageArray[_simpleStorageIndex];
    ssa.foo();
  }

  // 测试与Solidity_1合约的交互
  function testGetStore(uint _simpleStorageIndex) public view returns(uint) {
    Solidity_1 simpleStorage = simpleStorageArray[_simpleStorageIndex];
    return simpleStorage.getStore();
  }
  function testSetStore(uint _simpleStorageIndex,uint _val) public {
    Solidity_1 simpleStorage = simpleStorageArray[_simpleStorageIndex];
    simpleStorage.store(_val);
  }
}