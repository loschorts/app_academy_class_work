
function Board () {
  this.rows = [];

  for (i = 0; i < 3; i++) {
    this.rows.push([null, null, null]);
  }

  Array.prototype.my_transpose = function() {
    var originalArray = this;
    var numColumns = originalArray[0].length;
    var transposedArray = [];
    for (var i=0 ; i < numColumns ; i++){
      transposedArray.push([]);
    }
    originalArray.forEach(function(row, index1){
      row.forEach(function(element, index2){
        transposedArray[index2][index1] = element;
      })
    })
    return transposedArray;
  };

}

Board.prototype.columns = function(){
  return this.rows.my_transpose();
}

Board.prototype.won = function(){

  lines = [];
  for (i=0; i< 3; i++){
    lines.push(this.rows[i]);
    lines.push(this.columns()[i]);
  }

  lines.push([this.rows[0][0], this.rows[1][1], this.rows[2][2]]);
  lines.push([this.rows[0][2], this.rows[1][1], this.rows[2][0]]);

  console.log(lines.length);

  for (i = 0; i < lines.length; i++) {
    if (lines[i].toString() === ['x','x','x'].toString()) {
      return "x";
    } else if (lines[i].toString() === ['o','o','o'].toString()) {
      return "o";
    }
  }

  return false;
}

Board.prototype.empty = function(pos) {
  var row = parseInt(pos[1]);
  var col = parseInt(pos[3]);

  if (this.rows[row][col] === null) {
    return true;
  } else {
    return false;
  }
}

Board.prototype.placeMark = function(pos, mark) {
  var row = parseInt(pos[1]);
  var col = parseInt(pos[3]);
  if (this.empty(pos)) {
    this.rows[row][col] = mark;
  } else {
    console.log("Position already taken");
  }
}

Board.prototype.display = function() {
  console.log(this.rows);
}

module.exports = Board;
