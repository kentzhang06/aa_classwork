// inherits

// //Surrogate 
// Function.prototype.inherits = function(parent) {
//     // Define Surrogate constructor
//     function Surrogate() {};

//     // Set Surrogate prototype to parent prototype
//     Surrogate.prototype = parent.prototype;

//     // Create new Surrogate instance to automatically reassign child.prototype
//     this.prototype = new Surrogate();

//     // Reroute prototype constructor to the child constructor
//     this.prototype.constructor = this;
// }


// Object.create method
Function.prototype.inherits = function(parent) {
    this.prototype = Object.create(parent.prototype);
    this.prototype.constructor = this;
}

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

MovingObject.prototype.fly = function() {
    console.log("flying!!!!!");
}

const battleship = new Ship();
battleship.fly();

Asteroid.prototype.makeCrater = function() {
    console.log("I crashed and made a big hole...");
}

const asteroid1 = new Asteroid();
asteroid1.makeCrater();
asteroid1.fly();

console.log(asteroid1.__proto__.__proto__ === MovingObject.prototype);
console.log(Asteroid.prototype === MovingObject.prototype);
