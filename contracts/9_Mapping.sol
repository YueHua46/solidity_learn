// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

contract SimpleStorage2 {
    // mapping数据结构,保存键值对的关系
    // address是key的类型,uint是value类型
    mapping(address => uint256) public balances;

    function getBalances(address _address) view public returns(uint256) {
        return balances[_address];        
    }

    function addAddress (address _address,uint256 _balances) public {
        balances[_address] = _balances;
    }

    function removeAddress (address _addr) public {
        delete balances[_addr];
    }

    // 注意:
    /* 
     * 1.
     *  mapping的键类型可以是任何基本类型，如bool、uint、int、address、bytes等。
     *  但不能是复杂类型，如数组、结构体、枚举等。
     * 2.
     *  mapping的值类型可以是任何类型，包括复杂类型。你甚至可以使用嵌套的mapping作为值类型。
     * 3.
     *  mapping不能被遍历或获取其长度。你只能通过指定键来访问或修改值。
     * 4.
     *  mapping不能被复制或比较。你只能操作单个键值对。
     * 5.
     *  mapping默认初始化为零值，即所有的键都对应零值。你不能检查一个键是否存在于mapping中，因为所有的键都被认为是存在的。
    */
}

contract NestedMapping {
    // 嵌套mapping
    mapping(address => mapping(uint => bool)) public nestedMapping;

    function get(address _addr,uint i) public view returns(bool) {
        // 嵌套访问mapping value
        return nestedMapping[_addr][i];
    }

    function set(address _addr,uint i,bool _bool) public {
        nestedMapping[_addr][i] = _bool;
    }

    function remove(address _addr,uint i) public {
        delete nestedMapping[_addr][i];
    }
}