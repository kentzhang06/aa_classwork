import React from "react";

class StepListItem extends React.Component{
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <ul>
        <li>{this.props.step.title}</li>
        <li>{this.props.step.body}</li>
        <button onClick={this.updateDelete}>Delete</button>
      </ul>
    )
  }
}

export default StepListItem;