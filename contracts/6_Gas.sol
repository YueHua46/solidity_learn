// SPDX-License-Identifier: MIT 

/**
 * 单位：
 *  1 wei = 10^-18 eth
 *  1 gwei = 10^-9 eth
 * 每一次transaction（交易）都会消耗一定的Gas，不论交易成功与否
 * 计算方式：
 *  Gas花费 = 消耗的Gas数量（Gas Used） x Gas的价格（base fee + priority fee）
 *  其中 base fee 是协议设置的值（每个区块都有一个base fee作为底价），priority fee 是用户设置的值，即给验证者（矿工）的小费。
 */

contract Gas {
  uint public i = 0;

  //用完您发送的所有 Gas 会导致交易失败。
  //状态更改被撤消。
  //消耗的 Gas 不予退还。
  
  function forever() public {
    while(true) {
      // 对状态的一次操作等同于一次transaction（交易）
      i += 1;
    }
  }
  
}