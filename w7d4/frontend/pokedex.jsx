var React = require('react');
var ReactDom = require('react-dom');
var PokemonsIndex = require('./component/pokemonsIndex.jsx');
var Router = require('react-router').Router;
var Route = require('react-router').Route;
var App = require('./component/app.jsx');
var PokemonDetail = require('./component/PokemonDetail.jsx');
var ToysIndex = require('./component/ToysIndex.jsx');
var ToyDetail = require('./component/ToyDetail.jsx');
// APIUtil = require('./util/apiUtil');
// PokemonStore = require('./store/pokemonStore.js');

var routes = (
    <Route path="/" component={App}>
      <Route path="pokemon/:pokemonId" component={PokemonDetail}>
        <Route path='toys/:toyId' component={ToyDetail}/>
      </Route>
    </Route>
);

document.addEventListener('DOMContentLoaded', function(){
  ReactDom.render(
    <Router>{routes}</Router>,
    document.getElementById('root')
  );
});
