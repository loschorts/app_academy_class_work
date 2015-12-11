var React = require('react');
var BenchStore = require('../stores/bench_store');
var ApiUtil = require('../util/api_util');

var Index = React.createClass({
	getInitialState: function(){
		return {benches: BenchStore.all()};
	},
	_updateBenches: function(){
		console.log('updated benches');
		this.setState({benches: BenchStore.all()});
	},
	componentDidMount: function(){
		console.log("mounted");
		BenchStore.addListener(this._updateBenches);
		ApiUtil.fetchBenches();
	},
	render: function(){
		console.log("state", this.state.benches);
		var benches = this.state.benches.slice();
		var result = benches.map(function(bench){
			return <li>{JSON.stringify(bench)}</li>;
		});
		return <ul>{result}</ul>;
	}
});

module.exports = Index;