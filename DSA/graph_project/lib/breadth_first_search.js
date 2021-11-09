function breadthFirstSearch(startingNode, targetVal) {
  //use a queue: fifo
  //explore all nodes at given depth
  let queue = [ startingNode ];
  let visited = new Set();

  while (queue.length) {
    let curr = queue.shift();
    // skip node if it has been visited
    if (visited.has(curr)) continue;
    // add node if it hasn't been visited
    visited.add(curr);
    
    if (curr.val === targetVal) return curr;
    queue.push(...curr.neighbors);
  }

  return null;

}

module.exports = {
    breadthFirstSearch
};