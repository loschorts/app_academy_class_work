var React = require('react'),
    Clock = require('./clock.jsx'),
    Weather = require('./weather.jsx');

var WeatherClock = React.createClass ({


  render: function() {
    return (<div>
      <Clock/>
      <Weather/>
    </div>);
  }

});

module.exports = WeatherClock;
