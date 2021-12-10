var maxProduct = function (nums) {
  let maxSoFar = nums[0],
    minSoFar = nums[0];
  let largestProd = maxSoFar;

  for (let i = 1; i < nums.length; i++) {
    let num = nums[i];
    // 3 conditions for max
    // num
    // maxSoFar * num
    // minSoFar * num

    let tempMax = Math.max(num, maxSoFar * num, minSoFar * num);
    minSoFar = Math.min(num, maxSoFar * num, minSoFar * num);

    maxSoFar = tempMax;

    largestProd = Math.max(maxSoFar, largestProd);
  }

  return largestProd;
};
