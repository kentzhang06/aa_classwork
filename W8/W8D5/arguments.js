//with ... rest operator
function sum(...numbers) {
  return numbers.reduce((acc, el) => acc+el);
}

//with arguments keyword
function sum() {
  let sum = 0;
  for( let i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }
  return sum;
}

// myBind with arguments keyword

Function.prototype.myBind = function() {
  const that = this;
  const bindArgs = arguments;
  const args = [];
  for( let i = 1; i < arguments.length; i++) {
    args.push(arguments[i]);
  }

  return function() {
    const callArgs = [];
    for( let i = 0; i < arguments.length; i++) {
      callArgs.push(arguments[i]);
    }

    return that.apply(bindArgs[0], args.concat(callArgs));
  }
}


// myBind with rest operator

Function.prototype.myBind = function(ctx, ...bindArgs) {
  const that = this;

  return function(...callArgs) {
    return that.apply(ctx, bindArgs.concat(callArgs));
  }
}

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

function curriedSum(numArgs) {
  const numbers = [];

  return function _curriedSum(n1) {
    numbers.push(n1);
    if (numbers.length === numArgs) {
      return sum(...numbers);
    } else {
      return _curriedSum;
    }
  }
}

// const sum2 = curriedSum(4);
// console.log(sum2(5)(30)(20)(1));

Function.prototype.curry = function(numArgs) {
  const args = [];
  const that = this;

  return function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that.apply(that, args)
    } else {
      return _curry;
    }
  }
}

Function.prototype.curry2 = function(numArgs) {
  const args = [];
  const that = this;

  return function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that.call(that, ...args)
    } else {
      return _curry;
    }
  }
}

// foo(arg1, arg2, arg3);
// const fooCurried = foo.curry(4);
// fooCurried(arg1)(arg2)(arg3);

function sumThree(n1, n2, n3) {
  return n1 + n2 + n3;
}

const sumThreeCurried = sumThree.curry(3);
console.log(sumThreeCurried(2)(4)(6));

const sumThreeCurried2 = sumThree.curry2(3);
console.log(sumThreeCurried2(2)(4)(6));