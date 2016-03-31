(function(){
  var Asteroids = window.Asteroids;
  var ctx = Asteroids.ctx;

  var Game = Asteroids.Game = function(numAsteroids){
    this.numAsteroids = numAsteroids;
    this.ship = new Asteroids.Ship(
      [Asteroids.xDim / 2, Asteroids.yDim / 2]
    );
    this.addAsteroids();
    this.allObjects = [this.ship].concat(this.Asteroids);
  };

  Game.prototype.addAsteroids = function(){
    this.Asteroids = [];
    for ( var i = 0 ; i < this.numAsteroids ; ++i ){
      var randPos = this.randomPosition();
      this.Asteroids.push(new Asteroids.Asteroid(randPos));
    }
  };

  Game.prototype.randomPosition = function(){
    var newX = Math.floor(Asteroids.xDim * Math.random());
    var newY = Math.floor(Asteroids.yDim * Math.random());
    return [newX, newY];
  };

  Game.prototype.draw = function(){
    ctx.clearRect(0, 0, Asteroids.xDim, Asteroids.yDim);
    this.allObjects.forEach( function (asteroid){
      asteroid.draw();
    });
  };

  Game.prototype.moveObjects = function(){
    ctx.clearRect(0, 0, Asteroids.xDim, Asteroids.yDim);
    this.allObjects.forEach( function (object){
      object.move();
    });
  };

  Game.prototype.checkCollisions = function(){
    var asteroids = this.Asteroids;
    for (var first = 0 ; first < asteroids.length ; ++first){
      for (var second = first + 1 ; second < asteroids.length ; ++second ){
        if (asteroids[first].isCollidedWith(asteroids[second])){
          //do stuff;
        }
      }
    }
  };
})();
