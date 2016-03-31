var KeyAction = require('../actions/KeyAction.jsx');
var Note = require('./Note.js');
var Tones = require('../constants/Tones.js');
var KeyStore = require('../stores/KeyStore.js');
var Track = function(name){
  this.name = name;
  this.roll = [];
};

Track.prototype.startRecording = function(){
  this.roll = [];
  this.time = new Date();
};

Track.prototype.stopRecording = function(){
  this.addNotes([], new Date());
};

Track.prototype.addNotes = function(notes, timeStamp){
  var timeSlice = timeStamp - this.time;
  this.roll.push([notes, timeSlice]);
};

Track.prototype.play = function(i){
  KeyStore.activeKeys().forEach(function(key){
    KeyAction.silenceKey(key);
  });
  if (i > this.roll.length-1){
    return;
  }

  var currentNotes = this.roll[i][0];
  if (typeof this.roll[i+1] === 'undefined'){
    currentNotes.forEach(function(note){
      KeyAction.playKey(note);
    });
    return;
  }
  var interval = this.roll[i+1][1] - this.roll[i][1];
  currentNotes.forEach(function(note){
    KeyAction.playKey(note);
  });

  var self = this;

  setTimeout(function(){
    self.play(i+1);
  }, interval);
};

module.exports = Track;
