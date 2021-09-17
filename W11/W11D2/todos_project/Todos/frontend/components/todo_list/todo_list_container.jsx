import { connect } from "react-redux";
import TodoList from "./todo_list.jsx";
import {allTodos} from "../../reducers/selectors";
import { fetchTodos, receiveTodo, removeTodo, createTodo } from "../../actions/todo_actions.js";
import { clearErrors, receiveErrors } from "../../actions/error_actions.js";

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state)
  }
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    removeTodo: (todo) => dispatch(removeTodo(todo)),
    fetchTodos: () => dispatch(fetchTodos()),
    createTodo: (todo) => dispatch(createTodo(todo)),
    receiveErrors: (errors) => dispatch(receiveErrors(errors)),
    clearErrors: () => dispatch(clearErrors())
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);