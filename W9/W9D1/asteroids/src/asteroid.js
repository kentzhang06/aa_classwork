const MovingObject = require("./moving_object");
const Utils = require("./utils");
const Ship = require("./ship");

function Asteroid(pos, game) {
  this.COLOR = "#DDA0DD";
  this.RADIUS = 20;
  this.pos = pos;
  this.vel = [getRandomInt(-3, 3), getRandomInt(-3, 3)];
  this.game = game;

  MovingObject.call(this, { pos: this.pos, vel: this.vel, color: this.COLOR, radius: this.RADIUS, game: this.game } );
}

Utils.inherits(Asteroid, MovingObject);


function getRandomInt(min, max) {
  let result = 0;
  while (!result) {
    result = Math.random() * (max - min) + min;
  }
  return result;
}

Asteroid.prototype.collideWith = function (otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  }
}

module.exports = Asteroid;

