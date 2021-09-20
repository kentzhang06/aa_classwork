import React from "react";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  render() {
    console.log(this.props.pokemon);
    console.log('hello');
    const img = this.props.pokemon.imageUrl;

    if (this.props.pokemon === undefined) {
      return {};
    }
    return (
      <div>
        <img src={img} />
        {this.props.pokemon.name}
        {this.props.pokemon.type}
        {this.props.pokemon.attack}
        {this.props.pokemon.defense}
      </div>
    )
  }
}

export default PokemonDetail;