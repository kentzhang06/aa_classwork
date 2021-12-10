var removeNthFromEnd = function (head, n) {
  // initialize first pointer
  // initialize second pointer
  // advance second pointer to n places in front
  // iterate until second pointer's next value is null
  // advancing both first and second pointer each time

  // point first pointer to it's next next
  // return dummy

  let first = head,
    second = head;

  for (let i = 0; i < n; i++) {
    first = first.next;
  }
  if (!first) return head.next;

  while (first.next) {
    first = first.next;
    second = second.next;
  }

  second.next = second.next.next;

  return head;
};
