var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/dispatcher');

var BenchConstants = require('../constants/bench_constants');

var _benches = [];
var BenchStore = new Store(AppDispatcher);

BenchStore.all = function () {
	return _benches.slice();
};

BenchStore.resetBenches = function(benches){
	_benches = benches;
	BenchStore.__emitChange();
};

BenchStore.addBench = function(bench){
	_benches.push(bench);
	BenchStore.__emitChange();
};

BenchStore.__onDispatch = function (payload) {
	switch(payload.actionType) {
		case BenchConstants.BENCHES_RECEIVED:
			var result = BenchStore.resetBenches(payload.benches);
			break;
		case BenchConstants.NEW_BENCH:
			var result = BenchStore.addBench(payload.bench);
			break;
	}
};

BenchStore.benchAt = function(marker) {
	var found = false;
	_benches.forEach(function(bench){
		if (bench.id === marker.benchId){
			found = true;
			return;
		}
	});
	return found;
};

module.exports = BenchStore;