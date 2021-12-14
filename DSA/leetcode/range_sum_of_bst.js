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

// binary search algo

var rangeSumBST = function (root, low, high) {
  // solve using binary search algo
  // initialize sum to 0
  // if root is greater than low, run function on root.left and add result to sum
  // if root is in between or equal to low and high, add to the sum
  // if root is less than high, run function on root.right and add result to sum

  // return sum

  let sum = 0;

  if (!root) return sum;

  if (root.val > low) {
    sum += rangeSumBST(root.left, low, high);
  }

  if (root.val >= low && root.val <= high) {
    sum += root.val;
  }

  if (root.val < high) {
    sum += rangeSumBST(root.right, low, high);
  }

  return sum;
};


