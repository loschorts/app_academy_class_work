var Store = require('flux/utils').Store;
var Dispatcher = require('../dispatcher/dispatcher');
var PokemonConstants = require('../constants/PokemonConstants');


var _pokemons = {};

var PokemonStore = new Store(Dispatcher);

PokemonStore.all = function(){
  return (
    Object.keys(_pokemons).map( function(pokekey) {
      return _pokemons[pokekey];
    })
  );
};
PokemonStore.find = function(id){
  return _pokemons[id];
};

PokemonStore.resetPokemons = function(pokemons){
  _pokemons = {};
  pokemons.forEach(function(pokemon){
    _pokemons[pokemon.id] = pokemon;
  });
  PokemonStore.__emitChange();
};

PokemonStore.resetSinglePokemon = function(pokemon){
  _pokemons[pokemon.id] = pokemon;
  PokemonStore.__emitChange();
};

PokemonStore.__onDispatch = function(payload){
  switch (payload.actionType) {
    case PokemonConstants.POKEMONS_RECEIVED:
      PokemonStore.resetPokemons(payload.pokemons);
      break;
    case PokemonConstants.SINGLE_POKEMON_RECEIVED:
      PokemonStore.resetSinglePokemon(payload.pokemon);
      break;
  }

};


module.exports = PokemonStore;
