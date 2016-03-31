(function () {


  var Asteroids = window.Asteroids;
  var ctx = Asteroids.ctx;

  var MovingObject = Asteroids.MovingObject = function(options){
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;

  };

  MovingObject.prototype.draw = function(){
    ctx.fillStyle = this.color;
    ctx.beginPath();

    var centerX = this.pos[0];
    var centerY = this.pos[1];

    ctx.arc(
      centerX,
      centerY,
      this.radius,
      0,
      2 * Math.PI,
      false
    );

    ctx.fill();
  };

  MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    if (this.pos[0] < 0){
      this.pos[0] = Asteroids.xDim;
    } else if (this.pos[0] > Asteroids.xDim){
      this.pos[0] = 0;
    }
    if (this.pos[1] < 0){
      this.pos[1] = Asteroids.yDim;
    } else if (this.pos[1] > Asteroids.yDim){
      this.pos[1] = 0;
    }
  };

  MovingObject.prototype.isCollidedWith = function(otherObject){
    var dx2 = Math.pow(this.pos[0] - otherObject.pos[0], 2);
    var dy2 = Math.pow(this.pos[1] - otherObject.pos[1], 2);
    var distance = Math.sqrt(dx2 + dy2);
    return (distance <= this.radius + otherObject.radius);
  };


})();
