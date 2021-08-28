const CONSTANTS = {
  GRAVITY:  0.8,
  FLAP_SPEED:  -8,
  TERMINAL_VEL:  12,
  BIRD_WIDTH:  40,
  BIRD_HEIGHT:  30
};

export default class Bird {
  constructor(dimensions) {
    // this.dimensions = dimensions;
    this.x = dimensions.width/3;
    this.y = dimensions.height/2;
    this.velocity = 0;
  }

  drawBird(ctx) {
    ctx.fillStyle = "red";
    ctx.fillRect(this.x, this.y, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);
  }

  animate(context) {
    this.move();
    this.drawBird(context);
  }

  move() {
    this.velocity += this.y;
    this.velocity += CONSTANTS.GRAVITY;
  }

  flap() {
    this.velocity = CONSTANTS.FLAP_SPEED;
  }
}