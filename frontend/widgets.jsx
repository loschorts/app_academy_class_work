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
      nameList: nameList
    };},
  render: function () {
    return(
      <AutoComplete nameList = {this.state.nameList}/>
    );
  }
});

document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(<Widgets />, document.getElementById('root'));
});
