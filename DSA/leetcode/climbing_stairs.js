var climbStairs = function (n) {
  let prev = 0;
  let curr = 1;
  let temp;

  for (let i = 0; i < n; i++) {
    temp = prev;
    prev = curr;
    curr += temp;
  }

  return curr;
};
