import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form"

class TodoList extends React.Component{
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render () {
    return (
      <ul>
        {
        this.props.todos.map((todo, i) => <div key={i}> <TodoListItem todo={todo} removeTodo={this.props.removeTodo} receiveTodo={this.props.receiveTodo}/> </div>)
        }
        <div>
          <h1>Todo Form</h1>
          <TodoForm receiveTodo={this.props.receiveTodo} createTodo={this.props.createTodo} receiveErrors={this.props.receiveErrors} clearErrors={this.props.clearErrors}/> 
        </div>
      </ul>
    )
  }
}

export default TodoList;