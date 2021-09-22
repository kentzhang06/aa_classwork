import React from "react";
import { Redirect } from "react-router";
import { Link } from "react-router-dom";

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user)
      .then(() => this.props.history.push('/'));
  }

  update(field) {
    return (e) => this.setState({ [field]: e.target.value});
  }

  render() {
    const { formType, errors } = this.props;
    let displayErrors = (errors) ? (errors.map((err) => <li>{err}</li>) ) : <div></div>;
    let formLink = (formType === "login") ? (<Link to="/signup">Sign Up</Link>) : (<Link to="/login">Login</Link>);

    return(
      <div>
        <h2>{formType}</h2>
        <form onSubmit={this.handleSubmit}>
          <label> Username:
            <input type="text" value={this.state.username} onChange={this.update('username')} />
          </label>
          <label> Password:
            <input type="password" value={this.state.password} onChange={this.update('password')} />
          </label>
          <button>{formType}</button>
        </form>
        {formLink}
        <ul>{displayErrors}</ul>

      </div>
    )
  }
}

export default SessionForm;