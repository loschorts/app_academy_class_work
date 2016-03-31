var React = require('react');
var history = require('react-router').History;

var ToyIndexItem = React.createClass({
  mixins: [history],

  showToyDetail: function(){
    // console.log("showing");
    // window.thisHist = this.history;
    // console.log(this.history);
    // debugger
    var url = 'pokemon/' + this.props.toy.pokemon_id + '/toys/' + this.props.toy.id;
    this.history.push(url);
  },

  render: function(){
    return (
      <div onClick={this.showToyDetail}>
        <ul>
          <li key='1' >{this.props.toy.name}</li>
          <li key='2' >{this.props.toy.price}</li>
          <li key='3' >{this.props.toy.happiness}</li>
        </ul>
      </div>
    );
  }
});

module.exports = ToyIndexItem;
