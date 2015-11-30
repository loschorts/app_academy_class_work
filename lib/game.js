(function(){
  var Asteroids = window.Asteroids;
  var Game = Asteroids.Game = function(ctx, xDim, yDim, numAsteroids){
    this.ctx = ctx;
    this.xDim = xDim;
    this.yDim = yDim;
    this.numAsteroids = numAsteroids;
  };

  Game.prototype.addAsteroids = function(){
    this.Asteroids = [];
    for ( var i = 0 ; i < this.numAsteroids ; ++i ){
      var randPos = this.randomPosition();
      this.Asteroids.push(new Asteroids.Asteroid({ pos : randPos }));
    }
  };

  Game.prototype.randomPosition = function(){
    var newX = Math.floor(this.xDim * Math.random());
    var newY = Math.floor(this.yDim * Math.random());
    return [newX, newY];
  };

  Game.prototype.draw = function(ctx){
    this.ctx.clearRect(0, 0, this.xDim, this.yDim);
    this.Asteroids.forEach( function (asteroid){
      asteroid.draw();
    });
  };

  Game.prototype.moveObjects = function(ctx){
    this.ctx.clearRect(0, 0, this.xDim, this.yDim);
    this.Asteroids.forEach( function (asteroid){
      asteroid.move();
    });
  };
})();
