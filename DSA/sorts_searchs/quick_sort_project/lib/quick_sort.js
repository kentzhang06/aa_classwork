function quickSort(array) {
  if (array.length <= 1) return array;

  let pivot = array.shift();
  let left = [];
  let right = [];

  array.forEach(ele => {
    if (ele <= pivot) {
      left.push(ele);
    } else {
      right.push(ele);
    }
  });

  return quickSort(left).concat(pivot, quickSort(right));
}


module.exports = {
    quickSort
};