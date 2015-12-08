var React = require('react');
var TodoStore = require('../stores/todo_store.js');

var TodoForm = React.createClass({
  getInitialState: function(){
    return { title: "", body: "" };
  },
  handleChange: function(e){
    if (e.target.name === 'title')
    {
      this.setState({title: e.target.value});
    }
    if (e.target.name === 'body'){
      this.setState({body: e.target.value});
    }
  },
  handleSubmit: function(e){
    e.preventDefault();

    TodoStore.create(
      {
        title: this.state.title,
        body: this.state.body
      }
    );

  },
  render: function(){
    return (
      <form onSubmit={this.handleSubmit}>
        <input
          onChange={this.handleChange}
          type="text"
          name="title"
          value={this.state.title}/>
        <input
          onChange={this.handleChange}
          type="text"
          name="body"
          value={this.state.body}/>
        <input
          type="submit"
          value="Create New Todo"/>
      </form>
    );
  }
});

module.exports = TodoForm;
