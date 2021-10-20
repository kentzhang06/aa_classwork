function binarySearch(array, target) {
  let midIdx = Math.floor(array.length/2);
  let mid = array[midIdx];
  let result = false;
  
  if (mid === target) return true;
  if (array.length <= 1) return false;

  let left = array.slice(0, midIdx);
  let right = array.slice(midIdx+1);

  if (target < mid) {
    if(binarySearch(left, target)) result = true;
  } else {
    if (binarySearch(right, target)) result = true;
  }

  return result;
}

function binarySearchIndex(array, target) {
  let midIdx = Math.floor(array.length / 2);
  let mid = array[midIdx];
  let res = -1;

  if (mid === target) return midIdx;
  if (array.length <= 1) return -1;

  let left = array.slice(0, midIdx);
  let right = array.slice(midIdx + 1);

  if (target < mid) {
    res = binarySearchIndex(left, target);
  } else {
    let rightRes = binarySearchIndex(right, target);
    if (rightRes !== -1) {
      return rightRes + midIdx + 1;
    }
  }
  return res;

}


module.exports = {
    binarySearch,
    binarySearchIndex
};