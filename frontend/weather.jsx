var React = require('react');
var WeatherRequest = require('./weatherrequest.js');

var Weather = React.createClass ({

  getInitialState: function () {
    return ({currentWeather: "fetching your forecast..."});
  },

  componentDidMount: function () {
    this.getLocation();
  },

  getLocation: function(){
    var self = this;
    return navigator.geolocation.getCurrentPosition(function (locale) {
      self.getWeather(locale);
    });
  },

  getWeather: function(locale){
    var self = this;
    var lat = locale.coords.latitude;
    var lon = locale.coords.longitude;

    // console.log(lat, lon);
    WeatherRequest([lat, lon], function(weather){
      var forecast = JSON.parse(weather).main;
      var temp = ((forecast.temp - 273.15)* 1.8000 + 32.00).toFixed(2);
      var humidity = forecast.humidity;
      var readable = "Temp: " + temp + " " + "Humidity: " + humidity;
      self.setState({currentWeather: readable});
    });
  },

  render: function() {
    return (<div>
      {this.state.currentWeather.toString()}
    </div>);
  }

});

module.exports = Weather;
