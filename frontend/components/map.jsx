var React = require('react');
var ReactDom = require('react-dom');
var BenchStore = require('../stores/bench_store');
var ApiUtil = require('../util/api_util');
var MapActions = require('../actions/map_actions');

var _markers = [];

var Map = React.createClass({
	componentDidMount: function(){
		var map = ReactDom.findDOMNode(this.refs.map);
      	var mapOptions = {
       		center: {lat: 37.7758, lng: -122.435},
       		zoom: 13
      	};
      	this.map = new google.maps.Map(map, mapOptions);
        this.listenForMove();
      	BenchStore.addListener(this._createMarkers);
    },
    listenForMove: function(){
      var self = this;
      google.maps.event.addListener(this.map, 'idle', function(){
        _markers = [];
        var bounds = self.map.getBounds();
        var nE = {
          lat: bounds.getNorthEast().lat(),
          lng: bounds.getNorthEast().lng()
          };
        var sW = {
          lat: bounds.getSouthWest().lat(),
          lng: bounds.getSouthWest().lng()
          };
        ApiUtil.fetchBenches({
          northEast: nE,
          southWest: sW
        });
      });
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
        marker.addListener('click', function(){
          console.log(marker.title);
        });
    		_markers.push(marker);
    	});
    },
	render: function(){
		return <div className="map" ref="map">MAP</div>;
	}
});

window.myMap = Map;
module.exports = Map;