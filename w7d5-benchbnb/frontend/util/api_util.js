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
  },
  createBench: function(bench){
  	$.ajax({
  		url: 'api/benches',
  		type: 'POST',
  		data: {bench: bench},
  		success: function(bench){
  			ApiActions.receiveNew(bench);
  		}
  	});
  }
};

module.exports = ApiUtil;