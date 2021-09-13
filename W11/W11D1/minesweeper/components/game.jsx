import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from "./board";

class Game extends React.Component {
  constructor(props) {
    super(props);
    const initialBoard = new Minesweeper.Board();

    this.state = {
      board: initialBoard
    }

    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {

  }

  render() {
    return (
      <div>
        <Board board={this.state.board} updateGame={this.updateGame}/>
      </div>
    )
  }
}

export default Game;
