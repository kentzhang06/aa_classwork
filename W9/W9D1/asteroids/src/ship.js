const MovingObject = require("./moving_object");
const Utils = require("./utils");

module.exports = Ship;

function Ship(pos, game) {
  this.COLOR = "#FF0000";
  this.RADIUS = 10;
  this.vel = [0, 0];
  this.pos = pos;
  this.game = game;

  MovingObject.call(this, { pos: this.pos, vel: this.vel, color: this.COLOR, radius: this.RADIUS, game: this.game } );

}
Utils.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
  this.vel = [0, 0];
}
