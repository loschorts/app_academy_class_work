(function(){

  var GameView = Asteroids.GameView = function(game, ctx){
    this.game = game;
    this.ctx = ctx;
  };

  GameView.prototype.start = function(){
    setInterval(function(){
      this.game.moveObjects();
      this.game.draw();
    }, 20);
  };

})();
