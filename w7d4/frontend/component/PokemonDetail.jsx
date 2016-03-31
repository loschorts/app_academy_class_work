var React = require('react');
var PokemonStore = require('../store/pokemonStore.js');
var ApiUtil = require('../util/apiUtil.js');
var ToysIndex = require('./ToysIndex');

var PokemonDetail = React.createClass({
  getInitialState: function(){
    return {pokemon: this.getStateFromStore()};
  },
  componentDidMount: function(){
    PokemonStore.addListener(this._updateState);
    ApiUtil.fetchSinglePokemon(parseInt(this.props.params.pokemonId));
  },
  componentWillReceiveProps: function(newProps){
    ApiUtil.fetchSinglePokemon(newProps.params.pokemonId);
  },
  _updateState: function(){
    this.setState({pokemon: this.getStateFromStore()});
  },
  getStateFromStore: function(){
    return PokemonStore.find(parseInt(this.props.params.pokemonId));
  },
  renderChildren: function(){
    if (typeof this.props.children === 'undefined'){
      return <div></div>;
    } else {
      return (this.props.children);
    }
  },
  render: function(){
    if (typeof this.state.pokemon === 'undefined' ||
        typeof this.state.pokemon.toys === 'undefined' ){
      return <div></div>;
    }
    return (
      <div>
        <div className="pokemon-detail-pane">
          <div clasName = "detail">
            <h5>{this.state.pokemon.name}</h5>
            <img src={this.state.pokemon.image_url}></img>
            <ul>
              <li>{"Attack: " + this.state.pokemon.attack}</li>
              <li>{"Defense: " + this.state.pokemon.defense}</li>
            </ul>
          </div>
          <ToysIndex toys={this.state.pokemon.toys}/>
        </div>
        {this.renderChildren()}
      </div>
    );
  }

});

module.exports = PokemonDetail;
