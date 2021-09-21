import React from "react";
import Item from "../items/item";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.pokemonId);
  }

  componentDidUpdate(prevProps) {
    if(prevProps.pokemonId !== this.props.pokemon.id) {
      this.props.requestSinglePokemon(this.props.match.params.pokemonId)
    }
  }

  render() {

    const img = this.props.pokemon.imageUrl;

    if(!this.props.pokemon) return null;
    
    return (
      <div>
        <img src={img} />
        <li>{this.props.pokemon.name}</li>
        <li>Poke Type: {this.props.pokemon.pokeType}</li>
        <li>Attack: {this.props.pokemon.attack}</li>
        <li>Defense: {this.props.pokemon.defense}</li>
        <li>Moves: {this.props.moves}</li>
        {this.props.items.map((item) => 
          <Item item={item}></Item>
        )}
      </div>
    )
  }
}

export default PokemonDetail;