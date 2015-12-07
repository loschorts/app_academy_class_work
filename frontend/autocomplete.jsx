var React = require('react');

var AutoComplete = React.createClass({
  showNames: function () {
    var names = [];
    var searchVal = this.props.value;
    this.props.nameList.map(function (name) {
      if (name.match(searchVal)){
        names.push(name);
      }
    });
    names = names.map (function (name, idx) {
      return (<li key={idx}> {name} </li>);
    });

    return <ul>{names}</ul>;
  },

  inputBox: function () {
    return <input
      className="name"
      type="text"
      onChange={this.props.typingCallback}
            ></input>;
  },

  render: function () {
    return (
      <div>
        {this.inputBox()}
        {this.showNames()}
      </div>
    );
  }
});

module.exports = AutoComplete;
