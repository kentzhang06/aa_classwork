// Let's say you have a rectangular grid made up of squares representing a map.
// Each cell corresponds to a single region which can be either ocean or land.
// The map starts off filled with ocean. I'd like you to write two functions: one that takes coordinates i, j (row and column)
// and adds a land to it, which we can call addLand, and another that takes the map
// and calculates how many distinct islands there are, called countNumIslands.

// An island, for our purposes, is a contiguous landmass that can span multiple regions,
// which is surrounded by ocean in the four cardinal directions.
// We'll say that two land regions which only touch in the corners do _not_ count as adjacent.

//[[1, 1, 0],
// [0, 1, 1]]
// [ 1, 1, 1]
// 3

let addLand = function (grid, i, j) {
  grid[i][j] = 1;
};

let countNumIslands = function (grid) {
  let dir = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1],
  ];
  let numLand = 0;
  let visited = [];
  // iterate through each square in map
  // at each square check directions if valid island
  // if there is no land in directions, increment numIslands
  for (let i = 0; i < grid.length; i++) {
    for (let j = 0; j < grid[0].length; j++) {
      let currSpot = grid[i][j];
      if (currSpot === 1 && !isVisited(i, j)) numLand++;
      countSurrounding(visited, i, j, grid);
    }
  }
};

// mark visited land
let markVisited = function (visited, row, col, grid) {
  if (isVisited(row, col)) return -1;
  visited.push([row, col]);

  let dir = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1],
  ];
  for (let i = 0; i < dir.length; i++) {
    let [r, c] = dir[i];
    if (grid[row + r][col + c] === 1) {
      markVisited(visited, row + r, col + c, grid);
    }
  }
};

// return true or false if spot is in visited arr
let isVisited = function (row, col) {};
