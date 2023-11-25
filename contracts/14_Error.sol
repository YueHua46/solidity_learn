// SPDX-License-Identifier: MIT

/**
 * 错误将撤消在事务期间对状态所做的所有更改。
 * 可以通过调用 require 或 revert 与 assert 引发错误。
 *  - require 用于在执行之前验证输入和条件。
 *  - revert 类似于 require 。有关详细信息，请参阅下面的代码。
 *  - assert 用于检查不应为 false 的代码。断言失败可能意味着存在错误。
 */

contract Error {

  function testRequire(uint _i) public pure {
    // Require 应用于验证条件，例如：
    // - 输入
    // - 执行前的条件
    // - 从调用其他函数返回值
    require(_i > 10, unicode"输入必须大于10");
  }

  function testRevert(uint _i) public pure {
    // revert区别在于将错误的判断逻辑和抛错逻辑分离，而require则是集成了这两个逻辑
    if(_i <= 10) {
      revert(unicode"输入必须大于10");
    }
  }


  uint public num = 0;
  function testAssert() public view {
    // assert（断言）只能用于测试内部错误，
    // 并检查不变量。
    // 这里我们断言 num 始终等于 0
    // 因为不可能更新数字的值
    assert(num == 0);
  }

  // 自定义Error（使用error关键字）
  // 传入对应参数，这些参数会在抛错后打印到控制台以便调试
  struct ErrorData {
    uint balance;
    uint withdrawAmount;
  }
  struct ErrorResponse {
    ErrorData data;
    string info;
  }
  error InsufficientBalance(ErrorResponse errorResponse);
  
  function testCustomError(uint _withdrawAmount) public view {
    uint bal = address(this).balance;

    if(bal < _withdrawAmount) {
      // 使用自定义错误抛出错误，并将对应信息传递，会输出到控制台
      revert InsufficientBalance(ErrorResponse({
        data:ErrorData(bal,_withdrawAmount),
        info:unicode"余额不足"
      }));
    }
  }


}