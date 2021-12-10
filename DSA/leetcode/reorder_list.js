// O(n) time complexity O(1) space
var reorderList = function (head) {
  // hash to keep track of node and its index
  // iterate through copy of head to populate hash
  // create new linked list with correct pattern
  // return new list

  let stack = [];
  let node = head;

  while (node !== null) {
    stack.push(node);
    node = node.next;
  }

  node = head;

  while (node !== null) {
    let next = node.next;
    let endNode = stack.pop();

    node.next = endNode;
    endNode.next = next;
    node = next;
    if (node !== null && node.next === endNode) {
      node.next = null;
      break;
    }
  }

  return node;
};
