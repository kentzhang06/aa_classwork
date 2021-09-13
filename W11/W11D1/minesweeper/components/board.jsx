import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Tile from "./tile"

class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const rowFunc = (row) => row.map((tile, i) => {
      return (
        <Tile key={i} tile={tile} updateGame={this.props.updateGame} />
      );
      
    });
    
    const boardFunc = this.props.board.grid.map((row, i) => {
      return (
        <div className="row" key={i}>{rowFunc(row)}</div>
      );
    });
    
    return (
      <div>

        {boardFunc}
      </div>
    )

  }
}

export default Board;