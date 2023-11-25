// SPDX-License-Identifier: MIT

/**
 * 枚举
 * Solidity 支持枚举，它们对于建模选择和跟踪状态很有用。
 * 枚举可以在合同之外声明。并且可以从其他合约中导入enum
*/

import './11_2_Enum.sol';

contract Enum {
  // 代表运输状态的枚举
  // 如果从其他合约中导入了Status enum，则以下声明将命名冲突
  // enum Status {
  //   Pending,
  //   Shipped,
  //   Accepted,
  //   Rejected,
  //   Canceled
  // }

  //默认值是列出的第一个元素
  //类型的定义，在本例中为“Pending”
  Status public status;

  //返回 uint
  //待处理 -0
  //已发货 -1
  //已接受 -2
  //拒绝 -3
  //取消 -4

  function get () public view returns(Status) {
    return status;
  }
  function set(Status _status) public {
    status = _status;
  }
  function cancel() public {
    status = Status.Canceled;
  }
  function reset() public {
    delete status;
  }

}