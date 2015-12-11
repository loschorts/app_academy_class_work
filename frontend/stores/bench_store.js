var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/dispatcher');

var BenchConstants = require('../constants/bench_constants');

var _benches = [];
var BenchStore = new Store(AppDispatcher);

BenchStore.all = function () {
	console.log(_benches);
return _benches.slice();
};

BenchStore.resetBenches = function(benches){
	_benches = benches;
	BenchStore.__emitChange();
};

BenchStore.__onDispatch = function (payload) {
	console.log("benchstore dispatched");
	switch(payload.actionType) {
		case BenchConstants.BENCHES_RECEIVED:
			var result = BenchStore.resetBenches(payload.benches);
			break;
	}
};

module.exports = BenchStore;