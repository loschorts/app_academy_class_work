var React = require('react');

var AutoComplete = React.createClass({
  showNames: function () {
    var names = [];
    var searchVal = this.props.value;
    var clickCallback = this.props.clickCallback;

    this.props.nameList.map(function (name, idx) {
      if (name.match(searchVal)){
        names.push(
          <li
          onClick={clickCallback}
          key={idx}>           
            {name}
        </li>);
      }
    });

    return <ul>{names}</ul>;
  },

  inputBox: function () {
    return <input
      type="text"
      value={this.props.value}
      placeholder={this.props.placeholder}
      onChange={this.props.typingCallback}/>;
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
