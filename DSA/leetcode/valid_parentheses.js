var isValid = function (s) {
  const bracks = {
    ")": "(",
    "}": "{",
    "]": "[",
  };

  if (bracks.hasOwnProperty(s[0])) return false;

  let stacks = [];

  for (let c of s) {
    if (bracks.hasOwnProperty(c)) {
      let curr = stacks.pop();
      if (bracks[c] !== curr) return false;
      continue;
    }

    stacks.push(c);
  }

  if (stacks.length) return false;
  return true;
};
