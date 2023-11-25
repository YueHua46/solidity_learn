// SPDX-License-Identifier: MIT 

contract Array {
  // 动态长度数组
  uint[] public arr;
  // 初始化数组
  uint[] public arr2 = [1,2,3];
  // 固定长度数组
  uint[10] public myFixedSizeArr;

  function get(uint i) public view returns(uint) {
    return arr[i];
  }

  //Solidity 可以返回整个数组。
  //但是应该避免使用这个函数
  //长度可以无限增长的数组。
  function getArr() public view returns(uint[] memory){
    return arr;
  }

  function push(uint i) public {
    // 动态数组可以调用push方法
    arr.push(i);
  }

  function pop() public {
    // 删除数组最后一个元素
    arr.pop();
  }

  function getLength() public view returns(uint) {
    return arr.length;
  }

  function remove(uint i) public {
    //delete不会改变数组长度。
    //它将索引处的值重置为其默认值，
    //在本例中为 0
    delete arr[i];
  }

  function examples() external pure {
    // 在内存中创建数组，只能创建固定大小
    uint[] memory a = new uint[](7);
    a;
  }

  // 实现：通过从右向左移动元素来达到删除指定数组元素的目的
  function removeElement(uint _index) public {
    // 处理异常情况
    if(_index >= arr.length) return;
    if(arr.length == 1) {
      arr.pop();
      return;
    }

    for (uint i = _index; i < arr.length - 1;i++) {
      arr[i] = arr[i + 1];
    }
    arr.pop();
  }
}