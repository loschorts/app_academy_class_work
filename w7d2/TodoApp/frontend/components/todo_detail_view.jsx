var React = require("react"),
    TodoStore = require("../stores/todo_store.js");

var TodoDetailView = React.createClass({
  handleDelete: function(){
    TodoStore.destroy(this.props.todo.id);
  },
  render : function(){
    return (
      <div>
        {this.props.todo.body}
        <button type="button" onClick={this.handleDelete}>Delete</button>
      </div>
    );
  }
});

module.exports = TodoDetailView;
