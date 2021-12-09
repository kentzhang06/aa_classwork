var maxProfit = function (prices) {
  // initialize min to infinity
  // initialize max to 0
  // use hash to keep track of visited prices, with ith day as the value
  // iterate through each price
  // if price less than min, min = price

  let min = Infinity,
    maxProfit = 0;

  for (let i = 0; i < prices.length; i++) {
    // check if curr price is less than min
    if (prices[i] < min) {
      min = prices[i];
      // check if currPrice - min is greater than curr maxProfit
    } else if (prices[i] - min > maxProfit) {
      maxProfit = prices[i] - min;
    }
  }

  return maxProfit;
};
