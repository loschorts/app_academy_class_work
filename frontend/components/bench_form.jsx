var React = require ('react');
var LinkedStateMixin = require('react-addons-linked-state-mixin');


var BenchForm = React.createClass({
	mixins: [LinkedStateMixin],
	getInitialState: function(){
		return {lat: 0, long: 0, seating: 0, description: "Enter Description"};
	},
	createBench: function(){
		ApiUtil.createBench(this.state);
	},
	render: function(){
		return (
			<form onSubmit={this.createBench}>
			<label>Lat
				<input type="text" name="bench[lat]" valueLink={this.linkState("lat")}/>
			</label>
			<label>Long
				<input type="text" name="bench[long]" valueLink={this.linkState("long")}/>
			</label>
			<label>Name
				<input type="text" name="bench[name]" valueLink={this.linkState("name")}/>
			</label>
			<label>Seating
				<input type="text" name="bench[seating]" valueLink={this.linkState("seating")}/>
			</label>
			<label>Description
				<input type="text" name="bench[description]" valueLink={this.linkState("description")}/>
			</label>
			<input	type="submit" value="Create"/>
			</form>
		);
	}
});

module.exports = BenchForm;