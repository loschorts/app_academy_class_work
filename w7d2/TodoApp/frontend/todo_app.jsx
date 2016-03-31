var React = require("react"),
    ReactDOM = require("react-dom"),
    TodoList = require("./components/todo_list.jsx");

$(function(){
  ReactDOM.render(
    <TodoList />,
    document.getElementById("content")
  );
});
