var ApiActions = require('../actions/pokemonActions').ApiActions;



var APIUtil = {

  fetchAllPokemons: function(){
    $.ajax({
      url: 'api/pokemon',
      type: 'GET',
      success: function(pokemons){
        ApiActions.receiveAllPokemons(pokemons);
      }
    });
  },
  fetchSinglePokemon: function(id){
    $.ajax({
      url: 'api/pokemon/'+id,
      type: 'GET',
      success: function(pokemon){
        ApiActions.receiveSinglePokemon(pokemon);
      }
    });
  }

};


module.exports = APIUtil;
