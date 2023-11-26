// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
  您可以通过创建 struct .
  它们对于将相关数据组合在一起非常有用。
  结构可以在合约外部声明，也可以在另一个合约中导入。
 */

contract Todos {
  struct Todo {
    string text;
    bool completed;
  }

  Todo[] public todos;

  function create(string calldata _text) public {
    // 第一种push使用方式
    todos.push(Todo(_text,false));
    // 第二种push使用方式
    todos.push(Todo({
      text:_text,
      completed:false
    }));
    
    // 第三种push，先在函数作用域中定义memory结构体类型的数据，然后再push
    // memory只能在函数内定义，函数调用期间存在,调用结束则会销毁
    Todo memory todo;
    todo.text = _text;
    // 不赋值completed则默认false
    todos.push(todo);    
  }

  function get(uint _index) public view returns(string memory text,bool completed) {
    Todo storage todo = todos[_index];
    return (todo.text,todo.completed);
  }

  function updateText(uint _index,string calldata newText) public {
    Todo storage todo = todos[_index];
    todo.text = newText;
  }

  function toggleCompleted(uint _index) public {
    Todo storage todo = todos[_index];
    todo.completed = !todo.completed;
  }

  /**
   * 可以在外部通过导入当前sol文件来在外部使用Todo结构体  
   */
  /**
   * 例如外部代码：
   * // SPDX-License-Identifier: MIT
      pragma solidity ^0.8.20;

      import "./StructDeclaration.sol";

      contract Todos {
          // An array of 'Todo' structs
          Todo[] public todos;
      }
   */

}