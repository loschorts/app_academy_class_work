var React = require('react');
var ReactDom = require('react-dom');
var BenchStore = require('../stores/bench_store');
var ApiUtil = require('../util/api_util');

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
      var self = this;
      var myMap = this.map;

      //remove old markers

      var _tempMarkers = [];
      _markers.forEach(function(marker){
        if (!BenchStore.benchAt(marker)){
          marker.setMap(null);
        } else {
          _tempMarkers.push(marker);
        }
      });

      _markers = _tempMarkers;

      //find new markers

      var newBenches = [];
      BenchStore.all().forEach(function(bench){
        if (!self.hasMarker(bench, _markers)){
          newBenches.push(bench);
        }
      });

      //add new markers
      _markers = [];
      newBenches.forEach(function(bench){
        var marker = new google.maps.Marker({
          position : {lat: bench.lat, lng: bench.long},
          map: myMap,
          title: bench.description
        });
        marker.setMap(myMap);
        marker.addListener('click', function(){
        });
        marker.benchId = bench.id;
        _markers.push(marker);
      });  
    },
  render: function(){
    return <div className="map" ref="map">MAP</div>;
  },
  hasMarker: function(bench, markers){
    var result = false;
    markers.forEach(function(marker){
      if (marker.benchId === bench.id){
        result = true;
        return;
      }
    });
    return result;
  }
});

window.myMap = Map;
module.exports = Map;