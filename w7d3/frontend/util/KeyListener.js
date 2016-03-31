// var AppDispatcher = require('../dispatcher/Dispatcher.js');
var KeyActions = require('../actions/KeyAction.jsx');


var KeyListener = {


  Mapping: {
    65: 'C4',
    87: 'Db4',
    83: 'D4',
    69: 'Eb4',
    68: 'E4',
    70: 'F4',
    84: 'Gb4',
    71: 'G4',
    89: 'Ab4',
    72: 'A4',
    85: 'Bb4',
    74: 'B4',
    75: 'C5'
  },

  KeyUp: function(e){

    if(e.charCode == 0 && e.keyCode == 0) {return false;}

    var thisKey = KeyListener.Mapping[e.keyCode];
    KeyActions.silenceKey(thisKey);
  },

  KeyDown: function(e){
    var thisKey = KeyListener.Mapping[e.keyCode];
    KeyActions.playKey(thisKey);
  }
};

  $(document).on('keydown', KeyListener.KeyDown);
  $(document).on('keyup', KeyListener.KeyUp);

module.exports = KeyListener;
