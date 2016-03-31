var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function HanoiGame () {
  this.stacks = [[3, 2, 1],[], []];
  this.input_received = false;
}

HanoiGame.prototype.isWon = function() {
  if (this.stacks[1].length === 3 || this.stacks[2].length === 3) {
    return true;
  } else {
    return false;
  }
}

HanoiGame.prototype.isValidMove = function(startTowerIdx, endTowerIdx) {

  console.log(this);
  console.log(startTowerIdx);
  console.log(endTowerIdx);

  var startElement = this.stacks[startTowerIdx][this.stacks[startTowerIdx].length - 1];
  var endElement = this.stacks[endTowerIdx][this.stacks[endTowerIdx].length - 1];

  if (this.stacks[startTowerIdx].length === 0) {
    return false;
  } else if (this.stacks[endTowerIdx].length ===  0 || startElement < endElement) {
    return true;
  } else {
    return false;
  }
}

HanoiGame.prototype.move = function(startTowerIdx, endTowerIdx){
  if (this.isValidMove(startTowerIdx, endTowerIdx)) {
    this.stacks[endTowerIdx].push(this.stacks[startTowerIdx].pop());
  } else{
    console.log("Invalid Move");
  }
}

HanoiGame.prototype.print = function() {
  console.log(JSON.stringify(this.stacks));
}

HanoiGame.prototype.promptMove = function(callback, completionCallback){
  this.print();
  var game = this;

  reader.question("Enter Start Tower: ", function(firstTower){
    reader.question("Enter End Tower: ", function(endTower){
      callback.call(game, firstTower, endTower);
      
      if (game.isWon()) {
        completionCallback();
      } else {
        game.run(completionCallback);
      }
    });
  });
}

HanoiGame.prototype.run = function(completionCallback) {
  this.promptMove(this.move, completionCallback);
}

var game = new HanoiGame();

game.run(function() {
  console.log ("You won!");
  reader.close();
});
