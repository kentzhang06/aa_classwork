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

var lengthOfLongestSubstring = function (s) {
  let maxLen = 0, curr = 0;
  let hash = {};

  if(s.length < 2) {
    return s.length;
  }

  for(let i=0; i < s.length; i++) {
    //if curr character is not in hash
    if(hash[s[i]] == null) {
      curr += 1;
    // when you hit a character that repeats
    } else {
      curr = Math.min(i - hash[s[i]], curr+1);
    }
    maxLen = Math.max(maxLen, curr);
    // always save the index
    hash[s[i]] = i;
  }

  return maxLen;

}

//sliding window with set
var lengthOfLongestSubstring = function (s) {
  let set = new Set();
  let longest = 0;
  let j = 0; i = 0;

  while(i < s.length && j < s.length) {
    if(!set.has(s[j])) {
      set.add(s[j]);
      longest = Math.max(longest, j - i + 1);
      j++;
    } else {
      set.delete(s[i]);
      i++;
    }
  }

  return longest;
}
