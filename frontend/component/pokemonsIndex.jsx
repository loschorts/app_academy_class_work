var React = require('react');
var PokemonStore = require('../store/pokemonStore.js');
var ApiUtil = require('../util/apiUtil.js');
var PokemonIndexItem = require('./PokemonIndexItem.jsx');

var PokemonsIndex = React.createClass({
  getInitialState: function(){
    return {pokemons: PokemonStore.all()};
  },
  _updatePokemons: function(){
    this.setState({pokemons: PokemonStore.all()});
  },
  componentDidMount: function(){
    PokemonStore.addListener(this._updatePokemons);
    ApiUtil.fetchAllPokemons();
  },
  componentWillUnmount: function(){
    PokemonStore.removeListener(this._updatePokemons);
  },
  render: function(){
    var result = this.state.pokemons.map(function(pokemon, idx){
      return <PokemonIndexItem key={idx} pokemon={pokemon}/>;
    });
    return <div>{result}</div>;
  }
});

module.exports = PokemonsIndex;
