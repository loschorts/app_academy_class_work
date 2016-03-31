function Clock () {
  // 1. Create a Date object.
  // 2. Store the hours, minutes, and seconds.
  // 3. Call printTime.
  // 4. Schedule the tick at 1 second intervals.
  var date = new Date();

  this.hours = date.getHours();
  this.minutes = date.getMinutes();
  this.seconds = date.getSeconds();
  this._tick();

}

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  // Use console.log to print it.
  console.log(this.hours + ":" + this.minutes + ":" + this.seconds);
};

Clock.prototype._tick = function () {
  // 1. Increment the time by one second.
  // 2. Call printTime.
  var clock = this;
  setInterval(function(){
    clock.seconds += 1;
    if (clock.seconds === 60){
      clock.seconds = 0;
      clock.minutes++;
    }
    if (clock.minutes === 60){
      clock.minutes = 0;
      clock.hours++;
    }
    if (clock.hours === 24){
      clock.hours = 0;
    }
    clock.printTime();
  }, 1000);
};

var clock = new Clock();
