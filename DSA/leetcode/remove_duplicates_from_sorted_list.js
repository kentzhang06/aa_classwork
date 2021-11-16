var deleteDuplicates = function (head) {
  if (!head) return head;

  let copy = head;
  let result = new ListNode(copy.val, null);
  let resultCopy = result;

  while (copy.next) {
    if (resultCopy.val !== copy.next.val) {
      resultCopy.next = copy.next;
      resultCopy = resultCopy.next;
    }
    copy = copy.next;
  }
  return result;
};

var deleteDuplicates = function (head) {
  let curr = head;

  while (curr !== null && curr.next !== null) {
    if (curr.val === curr.next.val) {
      curr.next = curr.next.next;
    } else {
      curr = curr.next;
    }
  }

  return head;
};
