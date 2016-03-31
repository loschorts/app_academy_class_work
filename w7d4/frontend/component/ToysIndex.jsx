var React = require('react');
var ToyIndexItem = require('./ToyIndexItem.jsx');

var ToysIndex = React.createClass({

  render: function(){
    var showToys = this.props.toys.map(function(toy, idx){
      return <ToyIndexItem key={idx} toy={toy}/>;
    });
    return (
      <div>
        {showToys}
      </div>
    );
  }
});

module.exports = ToysIndex;
