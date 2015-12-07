var React = require('react');

var AutoComplete = React.createClass({
  render: function () {
    return <div>{this.props.nameList}</div>;
  }
});

module.exports = AutoComplete;
