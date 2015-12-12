var ApiActions = require('../actions/api_actions');

ApiUtil = {
  fetchBenches: function(bounds){
	$.ajax({
		url: 'api/benches?',
		data: {bounds: bounds},
		type: 'GET',
		success: function(benches){
			ApiActions.receiveAll(benches);
		}
    });
  }
};

module.exports = ApiUtil;