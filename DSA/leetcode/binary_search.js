// /**
//  * @param {number[]} nums
//  * @param {number} target
//  * @return {number}
//  */
var search = function (nums, target) {
  let midIdx = Math.floor(nums.length / 2);
  let mid = nums[midIdx];

  if (mid === target) return midIdx;
  if (nums.length <= 1) return -1;

  let left = nums.slice(0, midIdx);
  let right = nums.slice(midIdx + 1);

  if (target < mid) {
    return search(left, target);
  } else {
    let res = search(right, target);
    if (res !== -1) {
      return res + midIdx + 1;
    } else {
      return -1;
    }
  }
};
