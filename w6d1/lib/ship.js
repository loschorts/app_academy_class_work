/*global Asteroids */
/*global MovingObject */

(function(){
  var Asteroids = window.Asteroids;
  var MovingObject = Asteroids.MovingObject;

  var Ship = Asteroids.Ship = function(pos){
    this.pos = pos;
    this.radius = 20;
    this.color = "blue";
    this.vel = [0,0];
    this.angle = 0;
  };

  Ship.prototype.move = function(){
    console.log("ship moved");
  };

  Ship.prototype.power = function(impulse){
    this.vel[0] += impulse * Math.cos(this.angle);
    this.vel[1] += impulse * Math.sin(this.angle);
  };
  Asteroids.Util.inherits(Ship, MovingObject);


})();
