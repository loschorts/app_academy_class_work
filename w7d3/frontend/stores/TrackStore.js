var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/Dispatcher.js');

var _Tracks = [];
var TrackStore = new Store(AppDispatcher);

TrackStore.__onDispatch = function (action) {
  switch (action.actionType){
    case "ADD_TRACK":
      this.addTrack(action.track);
      break;
    case "REMOVE_TRACK":
      this.removeTrack(action.track);
      break;
  }
};
TrackStore.addTrack = function(track){
  _Tracks.push(track);
  TrackStore.__emitChange();
};

TrackStore.removeTrack = function(track){
  var idx = _Tracks.indexOf(track);
  _Tracks.splice(idx, 1);
  TrackStore.__emitChange();
};

TrackStore.all = function(){
  return _Tracks.slice();
};


module.exports = TrackStore;
