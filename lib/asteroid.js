(function(){

  var Asteroids = window.Asteroids;

  var Asteroid = Asteroids.Asteroid = function(pos){
    var vel = [Math.floor(Math.random() * 5), Math.floor(Math.random() * 5)];
    var options = {
      pos : pos,
      vel: vel,
      color: this.color,
      radius: this.radius
    };
    Asteroids.movingObject.call(this, options);

  Asteroid.color = '#8C6B41';
  Asteroid.radius = 100;


  };
  Asteroids.Util.inherits(Asteroid, Asteroids.movingObject);


})();
