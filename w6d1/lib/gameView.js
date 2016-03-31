/* global Asteroids */
/*global key */

(function(){

  var GameView = Asteroids.GameView = function(game, ctx){
    this.game = game;
    this.ship = game.ship;
    this.ctx = ctx;
  };

  GameView.prototype.crols = function(ship){
    window.key('a', function(){
      ship.angle -=( Math.PI * 2 ) / 20;
    });
    window.key('d', function(){
      ship.angle +=( Math.PI * 2 ) / 20;
    });
    window.key('w', function(){
      ship.power(1);
    });
    window.key('d', function(){
      ship.power(-1);
    });
  };


  GameView.prototype.start = function(){
    setInterval(function(){
      this.game.moveObjects();
      this.game.draw();
      this.game.checkCollisions();
      this.crols(this.ship).bind(this);
    }, 20);
  };


})();
