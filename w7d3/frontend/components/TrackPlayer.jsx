var React = require('react');
var TrackStore = require('../stores/TrackStore.js');
var TrackActions = require('../actions/TrackAction.jsx');


var TrackPlayer = React.createClass({
  removeTrack: function(){
    TrackActions.removeTrack(this.props.track);
  },
  playTrack: function(){
    this.props.track.play(0);
  },
  render: function(){
    return (<div>
      <button onClick={this.playTrack}>Play</button>
      <button onClick={this.removeTrack}>Delete</button>
    </div>);
  }
});

module.exports = TrackPlayer;
