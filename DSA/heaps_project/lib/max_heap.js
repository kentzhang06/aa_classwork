class MaxHeap {
    constructor() {
      this.array = [null];
    }

    getParent(idx) {
      return Math.floor(idx/2);
    }

    getLeftChild(idx) {
      return 2 * idx;
    }

    getRightChild(idx) {
      return 2 * idx + 1;
    }

    siftUp(idx) {
      // if idx is at the root
      if (idx === 1) return;

      // if parent is less than child
      let parent = this.array[this.getParent(idx)];
      if (parent < this.array[idx]) {
        // swap parent and child
        [this.array[this.getParent(idx)], this.array[idx]] = [
          this.array[idx],
          this.array[this.getParent(idx)],
        ];
      }

      // recursively siftUp
      return this.siftUp(this.getParent(idx));
    }

    insert(val) {
      this.array.push(val);

      this.siftUp(this.array.length - 1);
    }

    siftDown(idx) {
      let swapIdx;
      let arr = this.array;

      let left = this.getLeftChild(idx);
      let right = this.getRightChild(idx);
      let leftVal = arr[left];
      let rightVal = arr[right];

      if (!leftVal) leftVal = -Infinity;
      if (!rightVal) rightVal = -Infinity;

      if (arr[idx] > leftVal && arr[idx] > rightVal) return;

      if (leftVal > rightVal) {
        swapIdx = left;
      } else if (rightVal > leftVal) {
        swapIdx = right;
      }

      [ arr[idx], arr[swapIdx] ] = [ arr[swapIdx], arr[idx] ];

      this.siftDown(swapIdx);
    }

    deleteMax() {
      if (this.array.length === 2) return this.array.pop();
      if (this.array.length === 1) return null;

      let max = this.array[1];
      this.array[1] = this.array.pop();
      this.siftDown(1);


      return max;
    }

}

module.exports = {
    MaxHeap
};