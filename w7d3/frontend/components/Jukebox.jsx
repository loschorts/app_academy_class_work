var React = require('react');
var TrackStore = require('../stores/TrackStore.js');
var TrackPlayer = require('./TrackPlayer.jsx');

var Jukebox = React.createClass({
  getInitialState: function(){
    return {tracks: TrackStore.all()};
  },
  _tracksChanged: function(){
    this.setState({tracks: TrackStore.all()});
  },
  componentDidMount: function(){
    TrackStore.addListener(this._tracksChanged);
  },
  render: function(){
    var allTracks = this.state.tracks.map(function(track, idx){
      return <TrackPlayer key={idx}track={track}/>;
    });
    return (
      <div><h1>Jukebox</h1>{allTracks}</div>
    );
  }
});

module.exports = Jukebox;
