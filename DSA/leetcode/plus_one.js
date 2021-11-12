var plusOne = function (digits) {
  // get last value in array
  // add 1 to last value
  // if prev is 10, then carry = 1;

  //     let last = digits.length-1;
  //     let temp = digits[last] + 1;

  //     while (temp === 10) {
  //         digits[last] = temp % 10;
  //         last--;
  //         temp = digits[last] + 1;
  //     }

  //     digits[last] = temp;

  //     if (!temp) digits.unshift(1);

  //     return digits;

  let n = digits.length;

  for (let i = n - 1; i >= 0; i--) {
    if (digits[i] === 9) {
      digits[i] = 0;
    } else {
      digits[i]++;
      return digits;
    }
  }

  let res = Array(n + 1);
  res.fill(0);
  res[0] = 1;
  return res;
};
