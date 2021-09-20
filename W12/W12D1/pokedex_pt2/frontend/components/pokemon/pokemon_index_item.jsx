import React from "react";
import { Link } from "react-router-dom";

class PokemonIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const img = this.props.pokemon.imageUrl;
    const link = `/pokemon/${this.props.pokemon.id}`
    return(
      <ul className="pokemon-index-item">
        
        <li>
          <Link to={link}>
            {this.props.pokemon.id} 
            <img src={img} />
            {this.props.pokemon.name}
          </Link>
        </li>

      </ul>
    )
  }
}

export default PokemonIndexItem;