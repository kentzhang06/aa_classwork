// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
      this.value = val;
      this.next = null;
    }

}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
      this.head = null;
      this.tail = null;
      this.length = 0;
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
      const newNode = new Node(val);
      if (!this.head) {
        this.head = newNode;
      } else {
        this.tail.next = newNode;
      }

      this.tail = newNode;
      this.length++;
      return this;
    }

    // TODO: Implement the removeTail method here
    removeTail() {
      let currTail = this.tail;
      let copy = this.head;
      if(!this.head) return undefined;
      
      if(this.length === 1) {
        this.head = null;
        this.tail = null;
      }else {
        while(copy.next !== this.tail) {
          copy = copy.next;
        }
  
        this.tail = copy;
        this.tail.next = null;
      }


      this.length--;
      return currTail;
    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
      let newNode = new Node(val);
      
      if (!this.head) {
        this.head = newNode;
        this.tail = newNode;
      } else {
        newNode.next = this.head;
        this.head = newNode;
      }
      
      this.length++;
      return this;
    }

    // TODO: Implement the removeHead method here
    removeHead() {
      if(!this.head) return undefined;

      let currHead = this.head;

      if(this.length === 1) {
        this.head = null;
        this.tail = null;
      } else {
        this.head = this.head.next;
      }

      this.length--;
      return currHead;

    }

    // TODO: Implement the contains method here
    contains(target) {
      let curr = this.head;
      while(curr) {
        if (curr.value === target) return true;
        curr = curr.next;
      }

      return false;
    }

    // TODO: Implement the get method here
    get(index) {
      if(this.length - 1 < index) return null;
      let curr = this.head;

      for(let i = 0; i < index; i++) {
        curr = curr.next;
      }

      return curr;
    }

    // TODO: Implement the set method here
    set(index, val) {
      const nodeFound = this.get(index);
      if (nodeFound) {
        nodeFound.value = val;
        return true;
      }
      return false;
    }

    // TODO: Implement the insert method here
    insert(index, val) {
      if (this.length <= index || index < 0) return false;
      if (index === this.length) return !!this.addToTail(val);
      if (index === 0) return !!this.addToHead(val);

      const newNode = new Node(val);
      const prev = this.get(index-1);
      const temp = prev.next;
      prev.next = newNode;
      newNode.next = temp;
      this.length++;
      return true;
    }

    // TODO: Implement the remove method here
    remove(index) {

    }

    // TODO: Implement the size method here
    size() {

    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
