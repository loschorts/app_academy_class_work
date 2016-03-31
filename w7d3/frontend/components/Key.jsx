var React = require('react');
var Note = require('../util/Note.js');
var Tones = require('../constants/Tones.js');
var KeyStore = require('../stores/KeyStore.js');

var Key = React.createClass({
  getInitialState: function(){
    var thisTone = Tones[this.props.note];
    return {
      playing: false,
      sound: new Note(thisTone) };
  },

  _keysChanged: function () {
    if (KeyStore.activeKeys().indexOf(this.props.note) == -1)
    {
      this.setState({playing: false});
      this.state.sound.stop();
    } else {
      this.setState({playing: true});
      this.state.sound.start();
    }
  },
  componentDidMount: function(){
    KeyStore.addListener(this._keysChanged);
  },
  // componentWillUnmount: function(){
  //   KeyStore.removeListener(this._keysChanged);
  // },

  render: function(){
    var showPlaying = (this.state.playing) ? " playing" : " silent";
    return(
      <div>
        {this.props.note}
        {showPlaying}
      </div>
    );
  },
});

module.exports = Key;
