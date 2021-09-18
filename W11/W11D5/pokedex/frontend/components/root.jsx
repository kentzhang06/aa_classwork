import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndex from './pokemon/pokemon_index';

const Root = ({ store }) => (
  <Provider store={store}>
    <PokemonIndex />
  </Provider>
);

export default Root;