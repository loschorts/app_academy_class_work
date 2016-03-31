
var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback){
  if (numsLeft > 0) {
    reader.question("What Number? ", function(answer){
      answer = parseInt(answer);
      sum += answer;
      numsLeft--;
      addNumbers(sum, numsLeft, completionCallback);
    });
  } else {
    completionCallback(sum);
  }

};

addNumbers(0, 5, function(sum){console.log("SUM IS: " + sum)});
