var React = require('react');
var ReactDom = require('react-dom');
var BenchStore = require('./stores/bench_store');
var Index = require('./components/index');
var Search = require('./components/search');
var Router = require('react-router').Router;
var Route = require('react-router').Route;
var IndexRoute = require('react-router').IndexRoute;
var BenchForm = require('./components/bench_form');

var ApiUtil = require('./util/api_util.js');

var App = React.createClass({
	render: function(){
		return (
			<div>
				<header><h1>Bench BNB</h1></header>
				{this.props.children}
			</div>
			);
	}
});

var routes = (
	<Route path="/" component={App}>
		<IndexRoute component={Search}/>
		<Route path="benches/new" component={BenchForm}/>
	</Route>
);

document.addEventListener('DOMContentLoaded', function(){
  ReactDom.render(
    <Router>{routes}</Router>,
    document.getElementById('content')
  );
});