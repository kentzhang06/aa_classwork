import React from "react";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon;
  }

  render() {


    return (
      <div>
        {
          this.props.pokemon.map((el, i) => <li> el </li>)
        }
      </div>
    )
  }
}

export default PokemonIndex;