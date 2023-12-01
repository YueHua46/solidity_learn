const Loop = artifacts.require("Loop");
const expect = require('chai').expect;

describe('Loop',() => {
  let loop = null;
  // 部署合约
  before(async () => {
    loop = await Loop.deployed();
  });
  // 判断loop函数返回值是不是为10
  it('should return 10',async () => {
    const result = await loop.loop(10);
    console.log("loop return: ",result.toNumber());
    expect(result.toNumber()).to.equal(10);
  })
})

// 写一段测试


