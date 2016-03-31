var React = require('react');

var Clock = React.createClass ({
  getInitialState: function () {
    return ({ currentTime: new Date() });
  },

  componentDidMount: function () {
    this.intervalID = setInterval(this.tick, 1000);
  },

  componentWillUnmount: function () {
    clearInterval(this.intervalID);
  },

  tick: function () {
    this.setState({ currentTime: new Date() });
  },

  render: function() {
    return (<div>{this.state.currentTime.toString()}</div>);
  }

});

module.exports = Clock;
