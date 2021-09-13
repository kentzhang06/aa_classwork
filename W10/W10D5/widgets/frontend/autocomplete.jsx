import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      inputVal: ''
    };

    this.selectName = this.selectName.bind(this);
    this.matches = this.matches.bind(this);
    this.updateInput = this.updateInput.bind(this);
  }

  updateInput(event) {
    this.setState({inputVal: event.currentTarget.value});
  }

  matches() {
    const matches = [];
    if (this.state.inputVal.length === 0) return this.props.names;

    this.props.names.forEach(name => {
      const sub = name.slice(0, this.state.inputVal.length);
      if (sub.toLowerCase() === this.state.inputVal.toLowerCase()) {
        matches.push(name);
      }
    })

    if (matches.length === 0) matches.push('No matches');

    return matches;
  }

  selectName(event) {
    const name = event.currentTarget.innerText;
    this.setState({inputVal: name});
  }

  render() {
    return (
      <div className='autocomplete'>
        <input onChange={this.updateInput} value={this.state.inputVal} placeholder='...Searching'/>

        <ul>
          {this.matches().map((result, i) => {
            return (
              <li key={i} onClick={this.selectName}>{result}</li>
            );
          })}
        </ul>
      </div>
    );
  }
}


export default Autocomplete;