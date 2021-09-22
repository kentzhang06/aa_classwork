import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import {login, signup, logout} from "./actions/session_actions"


document.addEventListener("DOMContentLoaded", () => {
  let preloadedState = undefined;

  if(window.currentUser){
    preloadedState={
        entities: {
            users: {
                [window.currentUser.id]: window.currentUser
            }
        },
        session:{
            id: window.currentUser.id
        }
    };
  }

  // TESTING START
  const store = configureStore(preloadedState);
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.login = login;
  window.signup = signup;
  window.logout = logout;
  // TESTING END

  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);
});