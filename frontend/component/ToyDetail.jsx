var React = require('react');

var ToyDetail = React.createClass({
  getInitialState:function(){
    return {toy: 'this is the toy'};
  },
  getStateFromStore: function(){
  },
  _onChange: function(){},
  componentDidMount: function(){
    // PokemonStore.addListener(this._updateState);
    // ApiUtil.fetchSinglePokemon(parseInt(this.props.params.pokemonId));
  },
  componentWillUnmount: function(){},
  componentWillReceiveProps: function(){},
  render: function(){
    return <div>{this.state.toy}</div>;
  }

});

module.exports = ToyDetail;
