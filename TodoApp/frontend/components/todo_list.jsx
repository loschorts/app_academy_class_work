var React = require("react"),
    TodoStore = require("../stores/todo_store.js"),
    TodoForm = require('./todo_form.jsx'),
    TodoItem = require('./todo_item.jsx');

var TodoList = React.createClass({
  getInitialState: function(){
    return { todos: TodoStore.all() };
  },
  componentDidMount: function(){
    var self = this;
    TodoStore.fetch();
    TodoStore.addChangedHandler(function(){
      self.setState(
        {todos: TodoStore.all()}
      );
    }
    );
  },
  render: function(){
    return (
      <div id="todo">
        {this.state.todos.map(function(todo, idx){ return <TodoItem key={idx} todo={todo}/> })}
        <TodoForm/>
      </div>
    );
  }
});


module.exports = TodoList;
