var longestCommonPrefix = function (strs) {
  //initialize common prefix to empty string
  //iterate through length of the shortest word
  //add letter of each word if in common
  //return common prefix
  if (strs.length === 0) return "";

  let pre = "";
  for (let i = 0; i < strs[0].length; i++) {
    let currLetter = strs[0][i];
    const res = strs.filter((word) => word[i] === currLetter);
    if (res.length === strs.length) {
      pre += currLetter;
    } else {
      return pre;
    }
  }

  return pre;
};

strs = ["flower", "flow", "flight"];

longestCommonPrefix(strs);
