export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}

export const selectPokemonMovesNames = (state) => {
  const movesNames = Object.values(state.entities.moves).map((move) => {
    return move.name;
  })
  return movesNames
}