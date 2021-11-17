var Node = function () {
  this.children = {};
  this.isTerminal = false;
};

var Trie = function () {
  this.root = new Node();
};

Trie.prototype.insert = function (word, root = this.root) {
  let letter = word[0];

  if (!(letter in root.children)) {
    root.children[letter] = new Node();
  }

  if (word.length === 1) {
    root.children[letter].isTerminal = true;
  } else {
    this.insert(word.slice(1), root.children[letter]);
  }
};

Trie.prototype.search = function (word, root = this.root) {
  let letter = word[0];

  if (word.length === 0) {
    if (root.isTerminal) {
      return true;
    } else {
      return false;
    }
  }

  if (letter in root.children) {
    return this.search(word.slice(1), root.children[letter]);
  } else {
    return false;
  }
};

Trie.prototype.startsWith = function (prefix, root = this.root) {
  let letter = prefix[0];

  if (prefix.length === 0) {
    return true;
  }

  if (letter in root.children) {
    return this.startsWith(prefix.slice(1), root.children[letter]);
  } else {
    return false;
  }
};

