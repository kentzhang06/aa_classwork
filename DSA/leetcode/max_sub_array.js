var maxSubArray = function (nums) {
  // sliding window approach
  // initialize largest sum
  // iterate through nums
  // initialize temp sum of window

  // brute force approach
  //     let largestSum = -Infinity;

  //     for(let i = 0; i < nums.length; i++) {
  //         let currSum = 0;
  //         for(let j = i; j < nums.length; j++) {
  //             currSum += nums[j];
  //             largestSum = Math.max(currSum, largestSum);
  //         }

  //     }

  //     return largestSum;

  let currSub = nums[0];
  let maxSub = nums[0];

  for (let i = 1; i < nums.length; i++) {
    let num = nums[i];
    // if curr sub is negative throw it away, else keep adding
    currSub = Math.max(num, currSub + num);
    maxSub = Math.max(maxSub, currSub);
  }

  return maxSub;
};
