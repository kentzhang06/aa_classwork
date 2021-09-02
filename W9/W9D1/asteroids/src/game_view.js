const Game = require("./game");

function GameView (ctx) {
    this.game = new Game();
    this.ctx = ctx;


}

GameView.prototype.start = function () {
    function drawAndMove () {
        this.game.draw(this.ctx);
        this.game.step();
    }
    setInterval(drawAndMove.bind(this), 20);
    
}

module.exports = GameView;

