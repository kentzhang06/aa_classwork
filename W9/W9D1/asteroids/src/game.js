const Asteroid = require("./asteroid");
const Ship = require("./ship");

module.exports = Game;

function Game () {
    this.DIM_X = 640;
    this.DIM_Y = 640;
    this.NUM_ASTEROIDS = 3;
    this.asteroids = [];
    this.addAsteroids();
    this.ship = new Ship(this.randomPosition(), this);
}

Game.prototype.allObjects = function () {
  return this.asteroids.concat([this.ship]);
}

Game.prototype.addAsteroids = function () {
    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
        const ast = new Asteroid(this.randomPosition(), this);
        this.asteroids.push(ast);
    }    
}

Game.prototype.randomPosition = function () {
    return [getRandomInt(this.DIM_X), getRandomInt(this.DIM_Y)];
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
    let objects = this.allObjects();

    for (let i = 0; i < objects.length; i++) {
        objects[i].draw(ctx);
    }
}

Game.prototype.moveObjects = function () {
  let objects = this.allObjects();
    for (let i = 0; i < objects.length; i++) {
        objects[i].move();
    }
}

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];

  if (x > this.DIM_X) {
    x = 0;
  }else if (x < 0) {
    x = this.DIM_X;
  }

  if (y > this.DIM_Y) {
    y = 0;
  }else if (y < 0) {
    y = this.DIM_Y;
  }

  return [x, y];
}

Game.prototype.checkCollisions = function () {
  let objects = this.allObjects();
    for (let i = 0; i < objects.length; i++) {
        for (let j = i+1; j < objects.length; j++) {
            if (objects[i].isCollidedWith(objects[j])) {
                objects[i].collideWith(objects[j]);
            }
        }
    }
}

Game.prototype.step = function () {
    this.moveObjects();
    this.checkCollisions();
}

Game.prototype.remove = function (asteroid) {
    let idx = this.asteroids.indexOf(asteroid);
    this.asteroids.splice(idx, 1);
}



function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

