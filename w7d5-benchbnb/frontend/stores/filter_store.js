var Store = require('flux/utils').Store;
var AppDispatcher = require('../dispatcher/dispatcher');
var FilterConstants = require('../constants/filter_constants');

var FilterStore = new Store(AppDispatcher);

var _filters = [];

FilterStore.__onDispatch = function(payload){
	switch(payload.actionType) {
		case FilterConstants.FILTERS_UPDATED:
			FilterStore.updateFilters(payload.filters);
			break;
	}
};

FilterStore.updateFilters = function(filters){
	console.log("updating filters");
	_filters = filters;
};

FilterStore.all = function(){
	return _filters.slice();
};

module.exports = FilterStore;
//params are stored as POJOS: {name: "name", values: "values"}