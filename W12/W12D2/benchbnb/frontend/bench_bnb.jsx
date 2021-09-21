import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import {login, signup, logout} from './util/session_api_util';

document.addEventListener("DOMContentLoaded", () => {

    window.login = login;
    window.signup = signup;
    window.logout = logout;
    

  const root = document.getElementById("root");
  
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;

  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});