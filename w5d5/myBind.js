Function.prototype.myBind = function(context){
  var fn = this;
  return function(){
      fn.apply(context);
  };
};

function hello(){
  console.log("hello from " + this.name);
};

function Cat(name){
  this.name = name;
}

var cat = new Cat("Gizmo");


var bound = hello.myBind(cat);

bound();

hello.bind(cat)();


// console.log(cat);
