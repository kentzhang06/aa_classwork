// /**
//  * @param {number[][]} board
//  * @return {void} Do not return anything, modify board in-place instead.
//  */

var gameOfLife = function (board) {
  // iterate cells of the copy board 1 by 1
  // apply rules to original board based on copy of board

  // rules:
  // live -> die = -1
  // die -> live = 2

  // return board if board empty
  if (!board.length) return board;

  for (let i = 0; i < board.length; i++) {
    for (let j = 0; j < board[0].length; j++) {
      let score = checkNeighbors(i, j, board);
      if (board[i][j] === 1) {
        if (score < 2 || score > 3) {
          board[i][j] = -0.5;
        }
      } else if (board[i][j] === 0) {
        if (score === 3) {
          board[i][j] = 0.5;
        }
      }
    }
  }

  for (let i = 0; i < board.length; i++) {
    for (let j = 0; j < board[0].length; j++) {
      board[i][j] = Math.ceil(board[i][j]);
    }
  }
};

let checkNeighbors = function (row, col, board) {
  let score = -board[row][col];

  for (let r = row - 1; r <= row + 1; r++) {
    for (let c = col - 1; c <= col + 1; c++) {
      if (
        typeof board[r] !== "undefined" &&
        typeof board[r][c] !== "undefined"
      ) {
        score += Math.abs(Math.floor(board[r][c]));
      }
    }
  }

  return score;
};

let board = [
  [0, 1, 0],
  [0, 0, 1],
  [1, 1, 1],
  [0, 0, 0],
];

gameOfLife(board);
