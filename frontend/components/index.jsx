var React = require('react');
var BenchStore = require('../stores/bench_store');
var ApiUtil = require('../util/api_util');

var Index = React.createClass({
	getInitialState: function(){
		return {benches: BenchStore.all()};
	},
	_updateBenches: function(){
		this.setState({benches: BenchStore.all()});
	},
	componentDidMount: function(){
		BenchStore.addListener(this._updateBenches);
		ApiUtil.fetchBenches();
	},
	render: function(){
		var benches = this.state.benches.slice();
		var result = benches.map(function(bench, idx){
			return <li key={idx}>{JSON.stringify(bench)}</li>;
		});
		return <ul>{result}</ul>;
	}
});

module.exports = Index;