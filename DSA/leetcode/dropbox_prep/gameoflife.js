// /**
//  * @param {number[][]} board
//  * @return {void} Do not return anything, modify board in-place instead.
//  */

var gameOfLife = function (board) {
  // create copy of the board
  // iterate cells of the copy board 1 by 1
  // apply rules to original board based on copy of board

  const copy = Array.from(board);
  let alive;

  for (let m = 0; m < copy.length; m++) {
    for (let n = 0; n < copy[0].length; n++) {
      alive = countAlive([m, n], copy);
      console.log(alive);
      if(copy[m][n] === 1) {
        if (alive < 2 || alive > 3) {
          board[m][n] = 0;
        }else if (alive === 2 || alive === 3) {
          board[m][n] = 1;
        }
      }else if (copy[m][n] === 0){
        if (alive === 3) board[m][n] = 1;
      }
    }
  }

  console.log(board);
  return board;

};

var countAlive = function (pos, board) {
  let [m, n] = pos;
  let alive = 0;

  if (inbounds([m-1, n - 1], board) === true && board[m-1][n-1] === 1) alive++;
  if (inbounds([m-1, n], board) === true && board[m - 1][n] === 1) alive++;
  if (inbounds([m-1, n + 1], board) === true && board[m - 1][n + 1] === 1) alive++;
  if (inbounds([m, n - 1], board) === true && board[m][n - 1] === 1) alive++;
  if (inbounds([m , n + 1], board) === true && board[m][n + 1] === 1) alive++;
  if (inbounds([m + 1, n - 1], board) === true && board[m + 1][n - 1] === 1) alive++;
  if (inbounds([m + 1, n], board) === true && board[m + 1][n] === 1) alive++;
  if (inbounds([m + 1, n + 1], board) === true && board[m + 1][n + 1] === 1) alive++;

  return alive;
}

var inbounds = function(pos, board) {
  let [m, n] = pos;

  if ((m < 0 || m > board.length-1) || (n < 0 || n > board[0].length-1)){
    return false;
  }

  return true;
}

let board = [
  [0, 1, 0],
  [0, 0, 1],
  [1, 1, 1],
  [0, 0, 0],
];

gameOfLife(board);
