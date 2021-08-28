import Bird from './bird';
import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.myLevel = new Level(this.dimensions);
    this.myBird = new Bird(this.dimensions);
    this.restart();
  }

  animate(level, myBird) {
    level.drawBackground(this.ctx);
    myBird.animate(this.ctx);
    if (this.running) {
      requestAnimationFrame(this.animate);
    }
  }

  restart() {
    this.running = false;

    this.animate(this.myLevel, this.myBird);

  }

  play() {
    this.running = true;
    this.animate(this.myLevel, this.myBird);
  }
}