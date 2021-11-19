var rightSideView = function (root) {
  let res = [];
  if (!root) return res;
  let que = [root];

  while (que.length) {
    let levelSize = que.length;

    for (let i = 0; i < levelSize; i++) {
      let curr = que.pop();

      if (curr.left !== null) que.unshift(curr.left);
      if (curr.right !== null) que.unshift(curr.right);

      if (i === levelSize - 1) {
        res.push(curr.val);
      }
    }
  }

  return res;
};
