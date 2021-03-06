import { RECEIVE_ALL_POKEMON } from "../actions/pokemon_actions";

const pokemonReducer = (state={}, action) => {
  Object.freeze(state);
  let newState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      // newState = Object.assign({}, action.pokemon, newState)
      return {...state, ...action.pokemon}
    default:
      return state;
  }
}

export default pokemonReducer;