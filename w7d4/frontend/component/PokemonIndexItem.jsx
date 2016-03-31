var React = require('react');
var history = require('react-router').History;

var PokemonIndexItem = React.createClass({
  mixins: [history],
  showDetail: function(){
    var url = "/pokemon/"+this.props.pokemon.id;
    this.history.push(url);
  },
  render: function(){
    return (
      <div onClick={this.showDetail}>
        Name: {this.props.pokemon.name} Type: {this.props.pokemon.poke_type}
      </div>
    );
  },
});

module.exports = PokemonIndexItem;
