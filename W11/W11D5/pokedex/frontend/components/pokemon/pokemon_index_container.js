import { connect } from "react-redux";
import { requestAllPokemon } from "../../actions/pokemon_actions";
import { selectAllPokemon } from "../../reducers/selectors";
import PokemonIndex from './pokemon_index';


const mapStateToProps = state => {
  return {
    // piece of state that container subscribes to
    pokemon: selectAllPokemon(state)
  }
};

const mapDispatchToProps = dispatch => {
  return {
    requestAllPokemon: () => dispatch(requestAllPokemon())
  }
};

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);