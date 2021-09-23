export const UPDATE_BOUNDS = 'UPDATE_BOUNDS';
import { fetchBenches } from "./bench_actions";

const updateB = (bounds) => {
  return {
    type: UPDATE_BOUNDS,
    bounds
  }
}

// export const updateBounds = (bounds) => {
//   return (dispatch, getState) => {
//     dispatch(updateBounds(bounds));
//     return fetchBenches(getState().ui.filters)(dispatch);
//   }
// }

export function updateBounds(filter, value) {
  return (dispatch, getState) => {
    dispatch(updateB(filter, value));
    return fetchBenches(getState().ui.filters)(dispatch);
    // delicious curry!
  };
}