import * as APIUtil from "../util/todo_api_util";
import { receiveErrors } from "./error_actions";

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";


export function receiveTodos(todos) {
  return {
    type: RECEIVE_TODOS,
    todos,
  };
};

export function receiveTodo(todo) {
  return {
    type: RECEIVE_TODO,
    todo,
  };
};

export function removeTodo(todo) {
  return {
    type: REMOVE_TODO,
    todo,
  }
}

export function fetchTodos() {
  return (dispatch) => {
    return APIUtil.getTodos()
      .then(todos => dispatch(receiveTodos(todos)))
  }
}

export function createTodo(todo) {
  return (dispatch) => {
    return APIUtil.postTodo(todo)
      .then(
        todo => dispatch(receiveTodo(todo)),
        err => dispatch(receiveErrors(err.responseJSON))
        )
  }
}
