var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/Dispatcher.js');
var Tones = require('../constants/Tones.js');

var _activeKeys = [];
var KeyStore = new Store(AppDispatcher);

KeyStore.__onDispatch = function (action) {
  switch (action.actionType){
    case "PLAY_KEY":
      KeyStore.addKey(action.key);
      break;
    case "SILENCE_KEY":
      KeyStore.removeKey(action.key);
      break;
  }
};
KeyStore.addKey = function(key){
  if (_activeKeys.indexOf(key) == -1) {
    _activeKeys.push(key);
    KeyStore.__emitChange();
  }
};

KeyStore.removeKey = function(key){
  var idx = _activeKeys.indexOf(key);
  _activeKeys.splice(idx, 1);
  KeyStore.__emitChange();
};

KeyStore.activeKeys = function(){
  return _activeKeys.slice();
};


module.exports = KeyStore;
