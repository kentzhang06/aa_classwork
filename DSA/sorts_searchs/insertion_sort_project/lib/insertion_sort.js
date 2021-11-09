function insertionSort(arr) {
  //begin at i=1 because first element is considered sorted region of one element
  for(let i=1; i < arr.length; i++) {
    let currElement = arr[i];
    let j = i - 1;
    // iterate left through sorted region looking for spot to put currElement
    for(j; j >= 0 && currElement < arr[j]; j--) {

      // move j element to the right leaving a gap for inserting currElement
      arr[j+1] = arr[j];
    }
    // insert currElement into made gap
    arr[j+1] = currElement;
  }
  return arr;
}

module.exports = {
    insertionSort
};