import { UPDATE_BOUNDS } from "../actions/filter_actions"

const filterReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case UPDATE_BOUNDS:
      let newState = Object.assign({}, state, {'bounds': action.bounds});
      return newState;
    default:
      return state;
  }
}

export default filterReducer;