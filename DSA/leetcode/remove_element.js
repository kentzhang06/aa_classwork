var removeElement = function (nums, val) {
  let i = nums.length - 1,
    curr;

  while (i >= 0) {
    curr = nums.pop();
    if (curr !== val) nums.unshift(curr);
    i--;
  }

  return nums.length;
};
