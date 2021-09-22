import React from "react";
import { Route } from "react-router";
import GreetingContainer from "./greeting/greeting_container";
import LoginFormContainer from "../components/session/login_form_container";
import SignupFormContainer from "../components/session/signup_form_container";
import { AuthRoute } from "../util/route_util";

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>
    <Route exact path="/" component={GreetingContainer} />
    <AuthRoute path="/login" component={LoginFormContainer} />
    <AuthRoute path="/signup" component={SignupFormContainer} />

  </div>
);

export default App;