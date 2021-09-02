function MovingObject (vars) {
    this.pos = vars['pos'];
    this.vel = vars['vel'];
    this.radius = vars['radius'];
    this.color = vars['color'];
    this.game = vars['game'];
}

MovingObject.prototype.draw = function(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI,
        false
    );
    ctx.fill();
}

MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.isCollidedWith = function (otherObject) {
    let totalRadius = this.radius + otherObject.radius;
    let x1 = otherObject.pos[0];
    let y1 = otherObject.pos[1];
    let x2 = this.pos[0];
    let y2 = this.pos[1];

    let dist = Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2));

    return dist < totalRadius;
}

// MovingObject.prototype.collideWith = function (otherObject) {

// }

module.exports = MovingObject;