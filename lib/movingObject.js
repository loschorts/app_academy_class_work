(function () {

  var ctx = Asteroids.Util.ctx;

  var Asteroids = window.Asteroids;

  var movingObject = Asteroids.movingObject = function(options){
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;

  };

  movingObject.prototype.draw = function(ctx){
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

  movingObject.prototype.move = function(ctx){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
  };




})();
