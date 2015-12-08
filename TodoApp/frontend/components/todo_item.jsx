var React = require("react");

var TodoItem = React.createClass({
  render: function(){
    return (
      <div>
        {this.props.todo.title}
      </div>
    );
  }
});

module.exports = TodoItem;
