
var _todos = [];
var _callbacks = [];


var TodoStore = {
  changed: function(){
    _callbacks.forEach(function(func){
      func();
    });
  },

  addChangedHandler: function(func){
    _callbacks.push(func);
  },

  removeChangedHandler: function(func){
    var idx = _callbacks.indexOf(func);
    if( idx !== -1){
      _callbacks.splice(idx, 1);
    }
  },

  all: function(){
    return _todos.slice();
  },

  fetch: function(){
    $.get('/api/todos', {}, function(data){
      _todos = data;
      TodoStore.changed();
    }, "json");
  },

  create: function(newTodo){
    $.post('/api/todos', {todo: newTodo}, function(data){
      _todos.push(data);
      TodoStore.changed();
    }, "json");
  },

  destroy: function(id){
    var todo = TodoStore.find(id);
    if (typeof todo !== "undefined"){
      $.ajax({
        url: '/api/todos/'+id,
        type: 'DELETE',
        success: function(){
          var todoIdx = _todos.indexOf(todo);
          _todos.splice(todoIdx, 1);
          TodoStore.changed();
        }
      });
    }
  },

  find: function(id){
    for (var i = 0; i < _todos.length; i++) {
      if(_todos[i].id === id){
        return _todos[i];
      }
    }
  },

  toggleDone: function(id){
    var todo = TodoStore.find(id);
    if( typeof todo !== "undefined" ){
      todo.done = !todo.done;
      $.ajax({
        url:'/api/todos/'+id,
        data: {todo: {done: todo.done}},
        type: 'PATCH',
        success: function(data){
          TodoStore.changed();
        }
      });
    }
  }

};

module.exports = TodoStore;
