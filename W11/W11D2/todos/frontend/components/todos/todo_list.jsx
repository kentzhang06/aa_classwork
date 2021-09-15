import React from "react";
import TodoListItem from "./todo_list_item";

const TodoList = (props) => {
  return (
    <ul>
      {
      props.todos.map((todo) => <li> <TodoListItem todo={todo}/> </li>)
      }
    </ul>
  )
}

export default TodoList;