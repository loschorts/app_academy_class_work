var Board = require('./board.js');

var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function Game (reader) {
  this.board = new Board();
  this.mark = "x";
}

Game.prototype.promptMove = function(callback, completionCallback){
  this.board.display();

  if (this.mark === "x") {
    this.mark = "o";
  } else {
    this.mark = "x";
  }

  var game = this;
  reader.question("Enter position: ", function(pos){
    callback.call(game.board, pos, game.mark);

    if (game.board.won()) {
      completionCallback(game.board.won());
    } else {
      game.run(completionCallback);
    }
  });
}

Game.prototype.run = function(completionCallback) {
  var board = this.board
  this.promptMove(board.placeMark, completionCallback);
}

var game = new Game(reader);

game.run(function(winner) {
  console.log(winner + " has won the game!");
  reader.close();
})

module.exports = Game;
