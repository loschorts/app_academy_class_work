(function(){
  "use strict";

  var Asteroids = window.Asteroids;

  var Asteroid = Asteroids.Asteroid = function(pos){
    var vel = randomVelocity(4);
    var options = {
      pos : pos,
      vel: vel,
      color: '#8C6B41',
      radius: 35
    };
    Asteroids.MovingObject.call(this, options);
  };

  function randomVelocity(n){
    return [(Math.random() * n) - n/2, (Math.random() * n) - n/2];
  }


  Asteroids.Util.inherits(Asteroid, Asteroids.MovingObject);


})();
