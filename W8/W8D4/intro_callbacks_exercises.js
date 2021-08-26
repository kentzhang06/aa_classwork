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

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));