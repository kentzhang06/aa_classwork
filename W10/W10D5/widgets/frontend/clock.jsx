import React from "react";

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    }
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({ time: new Date() })
  }

  componentDidMount() {
    this.intervalID = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalID);
  }

  render() {
    return (
      <div className="state-time">
        { this.state.time.getHours()}:{ this.state.time.getMinutes() }:{ this.state.time.getSeconds() }
      </div>
    ) 
  }
}

export default Clock;

