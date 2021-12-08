var lengthOfLongestSubstring = function (s) {
  //initialize longestLength
  //iterate through each char of s
  //at each char, build longest string without repeating
  //record the length of the longest string, compare to curr longest

  let longestLength = 0;
  if (!s) return longestLength;

  for (let i = 0; i < s.length; i++) {
    let currWord = s[i];
    let j = i;
    while (s[j + 1] && !currWord.includes(s[j + 1])) {
      currWord += s[j + 1];
      j++;
    }
    // console.log(currWord);
    if (currWord.length > longestLength) longestLength = currWord.length;
  }

  return longestLength;
};
