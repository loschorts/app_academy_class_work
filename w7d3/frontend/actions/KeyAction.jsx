var AppDispatcher = require('../dispatcher/Dispatcher.js');

var KeyActions = {
  playKey: function (key){

    AppDispatcher.dispatch({
      actionType: "PLAY_KEY",
      key: key
    });

  },
  silenceKey: function (key){
    AppDispatcher.dispatch({
      actionType: "SILENCE_KEY",
      key: key
    });
  }
};

module.exports = KeyActions;
