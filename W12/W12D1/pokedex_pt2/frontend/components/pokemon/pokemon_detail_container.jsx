import { connect } from "react-redux";
import PokemonDetail from "./pokemon_detail";
import { requestSinglePokemon } from "../../actions/pokemon_actions";

const mapStatetoProps = (state, ownProps) => {
  return {
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId]
    // moves: state.entities.moves[ownProps.match.params.id],
    // items: state.entities.items[ownProps.match.params.id]
  }
}

const mapDispatchtoProps = (dispatch, ownProps) => {
  return {
    requestSinglePokemon: () => dispatch(requestSinglePokemon(ownProps.match.params.pokemonId))
  }
}

export default connect(mapStatetoProps, mapDispatchtoProps)(PokemonDetail);