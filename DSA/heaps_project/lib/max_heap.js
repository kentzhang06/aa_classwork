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

}

module.exports = {
    MaxHeap
};