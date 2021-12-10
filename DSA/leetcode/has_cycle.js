var hasCycle = function (head) {
  // initialize hash set
  // initialize curr index
  // iterate through linked list until curr.next is null
  // or curr.pos is less than curr index

  let set = new Set();

  let currNode = head;

  while (currNode !== null) {
    if (set.has(currNode)) {
      return true;
    }
    set.add(currNode);
    currNode = currNode.next;
  }

  return false;
};
