import React from "react";


class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    

    return (
      <ul>
        {
          this.props.pokemon.map((el, i) => <li key={i}> {el.name} </li>)
        }
        <li> Hello </li>
      </ul>
    )
  }
}

export default PokemonIndex;