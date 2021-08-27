// Timing is Everything
class Clock {
  constructor() {
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    this.seconds += 1;
    this.printTime();
  }

}

// const clock = new Clock();

//add Numbers

const readline = require("readline");
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft === 0){
    reader.close();
    return completionCallback(sum);
  }

  if (numsLeft > 0) {
    reader.question("Enter a number: ", num => {
      console.log(`The number you entered is: ${num}`);
      sum += parseInt(num);
      console.log(`Current sum is ${sum}`);
      addNumbers(sum, numsLeft-1, completionCallback);
    });
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


// absurdBubbleSort

function absurdBubbleSort (arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps){
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    }else {
      sortCompletionCallback(arr);
    }
  }

  outerBubbleSortLoop(true);
}

function askIfGreaterThan (el1, el2, callback) {
  console.log(`${el1} > ${el2} `)
  reader.question("Enter 'yes' or 'no': ", input => {
    console.log(`${input}`);
    if (input === 'yes'){
      callback(true);
    }else {
      callback(false);
    }
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i === (arr.length - 1)) {
    console.log("i == 0");
    return outerBubbleSortLoop(madeAnySwaps);
  }

  console.log("if statement")
  askIfGreaterThan(arr[i], arr[i+1], function(swap){
    console.log("swap");
    console.log(swap);
    if (swap) {
      let temp = arr[i];
      arr[i] = arr[i+1];
      arr[i+1] = temp;
      madeAnySwaps = true;
    }
    console.log("innerloop");
    innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
  });
}

// absurdBubbleSort([3, 2, 1], function(arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

// Function Calling

Function.prototype.myBind = function(context){
  debugger;
  return () => {this.apply(context)};
};

// class Lamp {
//   constructor() {
//     this.name = "a lamp";
//   }
// }

// const turnOn = function() {
//   console.log("Turning on " + this.name);
// };

// const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"
// reader.close();

// myThrottle and myDebounce

Function.prototype.myThrottle = function(interval) {
  
  let tooSoon = false;

  return (...args) => {
    if (!tooSoon){
      tooSoon = true;
      setTimeout(() => {tooSoon = false}, interval);
      this(...args);
    }
  }
}

// class Neuron {
//   fire(bang) {
//     console.log(`Firing! + ${bang}`);
//   }
// }

// const neuron = new Neuron();
// // When we create a new Neuron,
// // we can call #fire as frequently as we want

// // The following code will try to #fire the neuron every 10ms. Try it in the console:
// const interval = setInterval(() => {
//   neuron.fire('fire');
// }, 10);

// // You can use clearInterval to stop the firing:
// // clearInterval(interval);

// neuron.fire = neuron.fire.myThrottle(500);
// neuron.fire('fire');

// class SearchBar {
//   constructor() {
//     this.query = "";

//     this.type = this.type.bind(this);
//     this.search = this.search.bind(this);
//   }

//   type(letter) {
//     this.query += letter;
//     this.search();
//   }

//   search() {
//     console.log(`searching for ${this.query}`);
//   }
// }


// const searchBar = new SearchBar();

// const queryForHelloWorld = () => {
//   searchBar.type("h");
//   searchBar.type("e");
//   searchBar.type("l");
//   searchBar.type("l");
//   searchBar.type("o");
//   searchBar.type(" ");
//   searchBar.type("w");
//   searchBar.type("o");
//   searchBar.type("r");
//   searchBar.type("l");
//   searchBar.type("d");
// };

Function.prototype.myDebounce = function(interval) {
  // debugger;
  let timeOut;

  return (...args) => {
    // clearTimeout(timeOut);
    // debugger;
    const later = () => {
      clearTimeout(timeOut);
      this(...args);
    };

    clearTimeout(timeOut);
    timeOut = setTimeout(later, interval);
    
    
    // this(...args);
    
  }
  // clearTimeout(timeOut);
}

// searchBar.search = searchBar.search.myDebounce(5000);
// searchBar.search();
// queryForHelloWorld();