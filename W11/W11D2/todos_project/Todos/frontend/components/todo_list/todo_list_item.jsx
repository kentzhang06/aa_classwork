import React from "react";
import TodoDetailView from "./todo_detail_view";

class TodoListItem extends React.Component{
  constructor(props) {
    super(props);

    this.state = {
      detail: false,
      done: props.todo.done
    }

    this.updateDelete = this.updateDelete.bind(this);
    this.updateDone = this.updateDone.bind(this);
    this.showDetails = this.showDetails.bind(this);
  }

  showDetails() {
    if (this.state.detail){
      this.setState({detail: false});
    }else {
      this.setState({detail: true});
    }
  }

  updateDelete() {
    this.props.removeTodo(this.props.todo);
  }

  updateDone() {
    if (this.state.done) {
      this.setState({done: false})
    }else {
      this.setState({done: true})
    }
    this.props.receiveTodo(this.props.todo);
  }

  render() {
    let details = <div></div>;

    if(this.state.detail) {
      details = <TodoDetailView todo={this.props.todo}/>
    }

    return (
      <li>
        <div onClick={this.showDetails}>{this.props.todo.title}</div>
        {/* <button onClick={this.updateDelete}>Delete</button> */}
        <button onClick={this.updateDone}>{`${this.state.done}`}</button>

        {details}

      </li>
    )
  }
}

export default TodoListItem;