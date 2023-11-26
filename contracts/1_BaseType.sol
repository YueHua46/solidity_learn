// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

contract SimpleStorage {
  // base type
  /**
   * boolean
   * uint
   * int
   * address
   * bytes
   * string
   */

  // boolean
  // true / false
  bool public booleanValue = true;
  // uint 无符号整数
  // uint8 ~ uint256（默认情况下不指定位数，等价于 uint256）
  uint public uintValue;
  // int 有符号整数（默认情况下不指定位数，等价于 int256）
  // int8 ~ int256
  int public intValue = -123;
  // address 地址
  address public addressValue = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
  // bytes 字节
  // bytes1 ~ bytes32
  bytes public bytesValue = "1234567890 1234567890 1234567890 1234567890";
  // string 字符串
  string public strValue = "Five";

    // 结构体
    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // 定义单个person
    //    People public person = People({
    //        favoriteNumber:1,
    //        name:"Alex"
    //    });
    // 使用array来定义多个person
    // 1.动态数组(长度不固定)
    People[] public persons1;
    // 2.静态数组(长度固定)
    People[3] public persons2;

  /**
   * 可见性修饰符，用于定于变量和函数的可见性
   * public: 自动生成 getter 函数
   * private: 仅在此合约中可访问
   * internal: 仅在此合约和继承此合约的合约中可访问
   * external: 仅在其他合约中可访问
   */
   function store(uint256 _uintValue) public {
       uintValue = _uintValue;
   }
    // 部署到的合约地址为：0x05Ca2e3350f83aCE022F93E28d11823D16d6638F6cF99b256A661866Aec6D63B
    // 函数修饰符:view function（视图函数），不消耗gas，也不允许对状态做任何修改,只能读取状态变量并返回结果.
    function retrieve() public view returns(uint256) {
        return uintValue;
        // 在一个视图函数中调用纯函数,则会发生gas费用(调用函数的gas费用)
    }
    // 函数修饰符:pure functino （纯函数），不消费gas，表示不会读取或修改合约的状态变量,也不会发送以太币.只能通过
    // 使用自己的输入参数和内部定义的局部变量来计算结果
    function add() public pure returns(uint256) {
        return(1+1);     
    }
    // 只有在对状态进行更改（交易）才会发生gas费用，既读取state不用gas

    // memory的位置称为"数据位置修饰符",表示指定变量或函数参数的存储位置
    // 1.memory表示存储在内存中,意味着他们只能在函数调用期间存在,调用结束则会销毁
    // 2.storage表示永久存储在区块链上,将在整个合约的生命周期内存在(通常，状态变量（即在合约顶层定义的变量）会被隐式地声明为storage。)
    // 3.calldata表示存储在交易的调用数据中,同样的只能在函数调用期间存在,并且仅适用于外部函数的参数(形参),并且不可变.
    function addPerson1 (uint256 _favoriteNumber,string memory _name) public {
        persons1.push(People(_favoriteNumber,_name));
    }

    function addPerson2 (uint256 _favoriteNumber,string memory _name) public {
        // push方法只能用于动态大小的数组
        // persons2.push(People(_favoriteNumber,_name));
        People memory newPerson = People(_favoriteNumber,_name);
        persons2[0] = newPerson;
    }
}