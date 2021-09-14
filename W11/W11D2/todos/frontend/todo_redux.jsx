import React from "react";
import ReactDOM from "react-dom";
import { receiveTodos, receiveTodo, removeTodo } from "./actions/todo_actions";
import { receiveStep, receiveSteps, removeStep } from "./actions/step_actions";
import configureStore from "./store/store";

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById("root");
  ReactDOM.render(<h1>Todos APP</h1>, root);

  const store = configureStore;
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.removeTodo = removeTodo;
  window.receiveSteps = receiveSteps;
  window.receiveStep = receiveStep;
  window.removeStep = removeStep;
});