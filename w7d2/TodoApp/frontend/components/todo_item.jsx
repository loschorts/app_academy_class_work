var React = require("react"),
    TodoStore = require("../stores/todo_store.js"),
    TodoDetailView = require('./todo_detail_view.jsx');

var TodoItem = React.createClass({
  getInitialState: function(){
    return {expanded: false};
  },

  showDone: function(){
    if (this.props.todo.done){
      return "Mark Undone";
    } else {
      return "Mark Done";
    }
  },
  toggleDone: function(){
    TodoStore.toggleDone(this.props.todo.id);
  },
  toggleExpand: function(){
    this.setState({expanded: !this.state.expanded});
  },
  render: function(){
    var detailView = "";
    if(this.state.expanded){
      detailView = <TodoDetailView
                todo={this.props.todo}/>;
    }
    return (
      <div>
        <span onClick={this.toggleExpand}>
          {this.props.todo.title}
        {detailView}
        </span>
        <button type="button" onClick={this.toggleDone}>{this.showDone()}</button>
      </div>
    );
  }
});

module.exports = TodoItem;
