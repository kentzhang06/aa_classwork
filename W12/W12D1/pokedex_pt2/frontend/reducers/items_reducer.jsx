import { RECEIVE_POKEMON } from "../actions/pokemon_actions";

const itemsReducer = (state={}, action) => {
  Object.freeze(state);
  let newState = Object.assign({} , state);
  console.log(state);
  switch(action.type) {
    case RECEIVE_POKEMON:
      console.log(action.pokemon.items);
      newState = Object.assign({}, state, action.pokemon.items);
      return newState;
    default:
      return state;
  }
}

export default itemsReducer;