var React = require('react');
var ReactDom = require('react-dom');
var BenchStore = require('./stores/bench_store');
var Index = require('./components/index');
var Search = require('./components/search');

var Map = require('./components/map');

var ApiUtil = require('./util/api_util.js');

document.addEventListener('DOMContentLoaded', function(){
  ReactDom.render(
    <div><Search/></div>,
    document.getElementById('content')
  );
});