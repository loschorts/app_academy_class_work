var React = require('react');
var Map = require('./map');
var Index = require('./index');
var FilterStore = require('../stores/filter_store');

var Search = React.createClass({
	getInitialState: function(){
		return {filters: FilterStore.all()};
	},
	updateFilters: function(){
		this.setState({filters: FilterStore.all()});
	},
	componentDidMount: function(){
		FilterStore.addListener(this.updateFilters);
	},
	clickMapHandler: function(coords){
		this.props.history.pushState(null, 'benches/new', coords);
	},
	render: function(){
		return (
			<div>
				<Map clickMapHandler={this.clickMapHandler}/>
				<Index/>
			</div>
		);
	}
});

module.exports = Search;