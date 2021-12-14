// using bfs
var rangeSumBST = function (root, low, high) {
  // solve using bfs

  // initialize sum to low + high
  // if root doesn't exist return sum
  // initialize a queue with root
  // while queue is not empty
  // dequeue and save curr node
  // if curr value is in between or equal to low and high, add to sum
  // enqueue curr node's children

  //return sum

  let sum = 0;
  if (!root) return sum;

  let q = [root];

  while (q.length) {
    const curr = q.shift();
    if (curr.val >= low && curr.val <= high) sum += curr.val;

    if (curr.left) q.push(curr.left);
    if (curr.right) q.push(curr.right);
  }

  return sum;
};


