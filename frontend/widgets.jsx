var React = require('react');
var ReactDOM = require('react-dom');

var AutoComplete = require('./autocomplete.jsx'),
    WeatherClock = require('./WeatherClock.jsx');

var nameList = [
  "Bobby Tables",
  "PeiDa Kuo",
  "Ken Tran"
];

var tabs = [
  {title: "Title 1", content: "Content 1Content 1Content 1Content 1Content 1Content 1Content 1Content 1Content 1Content 1Content 1Content 1"},
  {title: "Title 2", content: "Content 2Content 2Content 2Content 2Content 2Content 2Content 2Content 2Content 2Content 2Content 2Content 2"},
  {title: "Title 3", content: "Content 3Content 3Content 3Content 3Content 3Content 3Content 3Content 3Content 3Content 3Content 3Content 3"},
  {title: "Title 4", content: "Content 4Content 4Content 4Content 4Content 4Content 4Content 4Content 4Content 4Content 4Content 4Content 4"},
  {title: "Title 5", content: "Content 5Content 5Content 5Content 5Content 5Content 5Content 5Content 5Content 5Content 5Content 5Content 5"},
  {title: "Title 6", content: "Content 6Content 6Content 6Content 6Content 6Content 6Content 6Content 6Content 6Content 6Content 6Content 6"},
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

  nameClickHandler: function(e) {
    // console.log("e.target is", e.target.value);
    this.setState ({ searchString: e.target.innerHTML});
    // debugger;
  },

  render: function () {
    return(
      <div>
        <AutoComplete
          nameList = {this.state.nameList}
          value={this.state.searchString}
          typingCallback={this.typingHandler}
          clickCallback={this.nameClickHandler}
          placeholder={this.state.searchString}/>
        <WeatherClock/>
      </div>
    );
  }
});

document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(<Widgets />, document.getElementById('root'));
});
