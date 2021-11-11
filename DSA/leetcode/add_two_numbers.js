/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
// /**
//  * @param {ListNode} l1
//  * @param {ListNode} l2
//  * @return {ListNode}
//  */

var addTwoNumbers = function (l1, l2) {
  let head = new ListNode(0, null),
    res = head,
    temp = 0,
    carry = 0;

  while (l1 || l2) {
    temp = (l1 ? l1.val : 0) + (l2 ? l2.val : 0) + carry;
    carry = temp >= 10 ? 1 : 0;

    res.val = temp % 10;

    if (l1) l1 = l1.next;
    if (l2) l2 = l2.next;

    if (l1 || l2 || carry !== 0) {
      res.next = new ListNode(carry, null);
      res = res.next;
    }
  }

  return head;
};
