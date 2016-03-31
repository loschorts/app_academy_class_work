var React = require('react');
var Key = require('./Key.jsx');
var Tones = require('../constants/Tones.js');
var Recorder = require('./Recorder.jsx');

var Keyboard = React.createClass({
  render: function () {
    var keys = Object.keys(Tones);
    keys = keys.map(function(key, idx){
      return <Key key={idx} note={key} />;
    });

    return(
      <div>
        {keys}
        <Recorder/>
      </div>
    );
  }

});

module.exports = Keyboard;
