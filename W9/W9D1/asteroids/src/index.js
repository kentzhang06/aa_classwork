console.log("Webpack is working!");

const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");
const Ship = require("./ship.js");

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;
window.GameView = GameView;
window.Ship = Ship;

document.addEventListener("DOMContentLoaded", function () {
    const canvas = document.getElementById('game-canvas');
    const ctx = canvas.getContext('2d');
    const mo = new MovingObject({
        pos: [30, 30],
        vel: [10, 10],
        radius: 5,
        color: "#00FF00"
    });

    const newGame = new GameView(ctx);
    newGame.start();
    // const newGame = new Game();
    // newGame.draw(ctx);

});