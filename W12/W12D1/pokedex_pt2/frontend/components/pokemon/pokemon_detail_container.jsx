import { connect } from "react-redux";
import PokemonDetail from "./pokemon_detail";
import { requestSinglePokemon } from "../../actions/pokemon_actions";
import { selectPokemonMovesNames } from "../../reducers/selectors";

const mapStatetoProps = (state, ownProps) => {
  return {
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId],
    moves: selectPokemonMovesNames(state),
    items: Object.values(state.entities.items)
  }
}

const mapDispatchtoProps = (dispatch, ownProps) => {
  return {
    requestSinglePokemon: () => dispatch(requestSinglePokemon(ownProps.match.params.pokemonId))
  }
}

export default connect(mapStatetoProps, mapDispatchtoProps)(PokemonDetail);