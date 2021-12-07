var removeDuplicates = function (nums) {
  // initialize counter for uniq nums
  // keep track of current unique num
  // iterate through nums array
  // if current num is different than curr uniq num, move to front of array and update uniq num, update counter
  // else if curr num is the same, continue
  // return counter

  let counter = 0,
    currUniq = Infinity,
    size = nums.length,
    i = 0;

  while (i < size) {
    let currNum = nums.pop();
    if (currNum !== currUniq) {
      currUniq = currNum;
      nums.unshift(currUniq);
      counter++;
    }
    i++;
  }

  return counter;
};
