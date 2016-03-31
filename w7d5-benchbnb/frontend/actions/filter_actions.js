var AppDispatcher = require('../dispatcher/dispatcher');
var FilterConstants = require('../constants/filter_constants');

FilterActions = {};

FilterActions.updateParams = function(filters){
	console.log("Filter Actions");
	AppDispatcher.dispatch({
		actionType: FilterConstants.FILTERS_UPDATED,
		filters: filters
	});
};

module.exports = FilterActions;