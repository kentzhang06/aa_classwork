var romanToInt = function (s) {
  const dic = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000,
    IV: 4,
    IX: 9,
    XL: 40,
    XC: 90,
    CD: 400,
    CM: 900,
  };

  let i = 0;
  let res = 0;

  while (i < s.length) {
    let pair = s[i] + s[i + 1];
    if (dic.hasOwnProperty(pair)) {
      res += dic[pair];
      i += 2;
    } else {
      res += dic[s[i]];
      i += 1;
    }
  }

  return res;
};
