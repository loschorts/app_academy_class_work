var React = require('react');
var Track = require('../util/Track.js');
var KeyStore = require('../stores/KeyStore.js');
var TrackStore = require('../stores/TrackStore.js');
var TrackActions = require('../actions/TrackAction.jsx');

var Recorder = React.createClass({
  getInitialState: function(){
    return {
      isRecording: false,
      track: new Track()
    };
  },
  _keysChanged: function(){
    if (this.state.isRecording){
      this.state.track.addNotes(KeyStore.activeKeys(), new Date());
    }
    this.setState({track: this.state.track});
  },
  componentDidMount: function(){
    KeyStore.addListener(this._keysChanged);
  },
  // componentWillUnmount: function(){
  //   KeyStore.removeListener(this._keysChanged);
  // },
  startRecording: function(){
    this.state.track.startRecording();
    this.setState({isRecording: true});
  },
  stopRecording: function(){
    this.state.track.stopRecording();
    this.setState({isRecording: false});
    TrackActions.addTrack(this.state.track);
    console.log(TrackStore.all());
  },
  play: function(){
    this.state.track.play(0);
  },

  render: function(){
    return (
      <div>
        <button onClick={this.startRecording}>Start Recording</button>
        <button onClick={this.stopRecording}>Stop Recording</button>
        <button onClick={this.play}>Play Recording</button>
      </div>
    );
  }
});

module.exports = Recorder;
