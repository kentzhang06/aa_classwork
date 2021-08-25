// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let myGrid = [...Array(8)].map(e => Array(8));
  myGrid[3][4] = new Piece('black');
  myGrid[4][3] = new Piece('black');
  myGrid[3][3] = new Piece('white');
  myGrid[4][4] = new Piece('white');
  return myGrid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (pos[0] < 0 || pos[1] < 0 || pos[0] > 7 || pos[1] > 7) {
    return false;
  }
  return true;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error('Not valid pos!');
  }
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.grid[pos[0]][pos[1]];

  if (piece === undefined) return false;

  if (piece.color === color){
    return true;
  }else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let piece = this.grid[pos[0]][pos[1]];

  if (piece === undefined) return false;
  return true;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip = []){
  let newPos = [pos[0] + dir[0], pos[1] + dir[1]];
  if (!this.isValidPos(newPos) || !this.isOccupied(newPos)) return [];
  if (this.isMine(newPos, color)) return piecesToFlip;
  
  piecesToFlip.push(newPos);
  return this._positionsToFlip(newPos, color, dir, piecesToFlip);
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) return false;
  for(let i = 0; i < Board.DIRS.length; i++){
    let dir = Board.DIRS[i];
    let validMoves = this._positionsToFlip(pos, color, dir);
    if (validMoves.length > 0) return true;
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)){
    throw new Error('Invalid move!');
  }
  let allValidMoves = [];
  this.grid[pos[0]][pos[1]] = new Piece(color);

  for(let i = 0; i < Board.DIRS.length; i++){
    let dir = Board.DIRS[i];
    let validMoves = this._positionsToFlip(pos, color, dir);
    allValidMoves = allValidMoves.concat(validMoves);
  };

  for(let i = 0; i < allValidMoves.length; i++){
    this.getPiece(allValidMoves[i]).flip();
  };
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let allValidMoves = [];

  for(let i = 0; i < this.grid.length; i++){
    for(let j = 0; j < this.grid.length; j++){
      let pos = [i, j];
      if (this.validMove(pos, color)){
        allValidMoves.push(pos);
      };
    };
  };

  return allValidMoves;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length > 0) return true;
  return false;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (!this.hasMove('white') && !this.hasMove('black')) return true;
  return false;
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for(let i = 0; i < this.grid.length; i++){
    let row = "";
    for(let j = 0; j < this.grid.length; j++){
      let piece = this.getPiece([i,j]);
      if (!this.isOccupied([i,j])){
        row += "_ ";
      } else {
        row += piece.toString() + " ";
      }
    };
    console.log(row);
  };
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE