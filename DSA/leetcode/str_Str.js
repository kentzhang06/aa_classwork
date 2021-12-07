var strStr = function (haystack, needle) {
  if (!needle) return 0;

  //iterate chars through haystack, check to see if first char of needle matches char
  //iterate through from the starting point char to see if match
  let currWord;

  for (let i = 0; i < haystack.length; i++) {
    if (haystack[i] === needle[0]) {
      currWord = haystack.slice(i, i + needle.length);
    }

    if (currWord === needle) return i;
  }

  return -1;
};
