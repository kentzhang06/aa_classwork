import { Route, Switch } from "react-router";
import React from "react";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import PokemonDetailContainer from "./pokemon/pokemon_detail_container";

const App = () => (
  <Switch>
    <Route path="/" component={PokemonIndexContainer} />
  </Switch>
) 

export default App;