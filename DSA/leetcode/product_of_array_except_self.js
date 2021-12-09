var productExceptSelf = function (nums) {
  // initialize length of arr
  // initialize answer arr
  // iterate from left to right, multiply answer[i-1] with nums[i-1] to get product for that index

  // initialize product of right to 1
  // iterate from right to left, multiply the product of right by answer[i]
  // multiply and save new value of product of right with nums[i];

  //return answer arr

  let length = nums.length;
  let ans = new Array(length);

  ans[0] = 1;
  for (let i = 1; i < length; i++) {
    ans[i] = ans[i - 1] * nums[i - 1];
  }

  let R = 1;
  for (let i = length - 1; i >= 0; i--) {
    ans[i] = R * ans[i];
    R *= nums[i];
  }

  return ans;
};
