class Node {
  constructor() {
    this.children = {};
    this.isTerminal = false;
  }
}

class Trie {
   constructor() {
     this.root = new Node();
   }

   insertRecur(word, root=this.root) {
     let letter = word[0];

     if (!(letter in root.children)) {
       root.children[letter] = new Node();
     }

     if (word.length === 1) {
       root.children[letter].isTerminal = true;
     } else {
       this.insertRecur(word.slice(1), root.children[letter]);
     }

   }

   insertIter(word) {
      let root = this.root;
      for(let i = 0; i < word.length; i++) {
        let letter = word[i];
        if (!(letter in root.children)) {
          root.children[letter] = new Node();
        }

        if (i === word.length - 1) {
          root.children[letter].isTerminal = true;
        }
        root = root.children[letter];
      }
   }

   searchRecur(word, root=this.root) {
      let letter = word[0];

      if (word.length === 0) {
        if (root.isTerminal) {
          return true;
        } else {
          return false;
        }
      }


      if (letter in root.children) {
        return this.searchRecur(word.slice(1), root.children[letter]);
      }else {
        return false;
      }
   }

   searchIter(word) {
      let root = this.root;

      for(let i=0; i < word.length; i++) {
        if (!(word[i] in root.children)) {
          return false;
        }
        root = root.children[word[i]];
      }

      return root.isTerminal;
   }
}

module.exports = {
    Node,
    Trie
};