var React = require('react');
var ReactDom = require('react-dom');
var BenchStore = require('../stores/bench_store');

var _markers = [];

var Map = React.createClass({
	componentDidMount: function(){
		var map = ReactDom.findDOMNode(this.refs.map);
      	var mapOptions = {
       		center: {lat: 37.7758, lng: -122.435},
       		zoom: 13
      	};
      	this.map = new google.maps.Map(map, mapOptions);
      	BenchStore.addListener(this._createMarkers);
    },
    _createMarkers: function(){
    	myMap = this.map;
    	BenchStore.all().forEach(function(bench){
    		var marker = new google.maps.Marker({
    			position : {lat: bench.lat, lng: bench.long},
    			map: myMap,
    			title: bench.description
    		});
    		marker.setMap(myMap);
    		_markers.push(marker);
    	});
    },
	render: function(){
		return <div className="map" ref="map">MAP</div>;
	}
});

window.myMap = Map;
module.exports = Map;