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
