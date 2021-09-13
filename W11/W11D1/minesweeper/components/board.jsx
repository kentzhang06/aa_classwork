import React from "react";
import * as Minesweeper from "../minesweeper.js";

class Board extends React.Component {
  constructor(props) {
    super(props);

    this.updateTile = this.updateTile.bind(this);
  }

  updateTile() {
    this.setState({})
  }

  render() {
    const rowFunc = (row) => row.map((tile, i) => {
      return (
        <div>Tiles</div>
      );
      // <Tile onClick={this.updateTile} key={i} tile={tile} updateGame={this.props.updateGame}/>
    });
    
    const boardFunc = this.props.board.grid.map((row, i) => {
      return (
        <div> {row} hi </div>
        // <div key={i}>{rowFunc(row)}</div>
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