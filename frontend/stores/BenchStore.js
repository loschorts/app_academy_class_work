var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/dispatcher');
var _benches = [];
var BenchStore = new Store(AppDispatcher);

BenchStore.all = function () {
return _benches.slice();
};

window.BenchStore = BenchStore;

module.exports = BenchStore