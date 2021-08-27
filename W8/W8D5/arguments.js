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

