var React = require('react');
var ReactDOM = require('react-dom');

var AutoComplete = require('./autocomplete.jsx');

var nameList = [
  "Bobby Tables",
  "PeiDa Kuo",
  "Ken Tran"
];

var Widgets = React.createClass({
  getInitialState: function(){
    return {
      nameList: nameList,
      searchString: ""
    };},

  typingHandler: function (e) {
    this.setState ({ searchString: e.target.value});
  },

  render: function () {
    return(
      <AutoComplete nameList = {this.state.nameList}
        value={this.state.searchString}
        typingCallback={this.typingHandler}
        placeholder="type your name"/>
    );
  }
});

document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(<Widgets />, document.getElementById('root'));
});
