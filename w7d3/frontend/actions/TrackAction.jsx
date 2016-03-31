var AppDispatcher = require('../dispatcher/Dispatcher.js');

var TrackActions = {
  addTrack: function(track){
    AppDispatcher.dispatch({
      actionType: "ADD_TRACK",
      track: track
    });
  },
  removeTrack: function(track){
    AppDispatcher.dispatch({
      actionType: "REMOVE_TRACK",
      track: track
    });
  }
};

module.exports = TrackActions;
