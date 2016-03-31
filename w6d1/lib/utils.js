(function (){
  "use strict";

  var Asteroids = window.Asteroids = {};
  var canvasEl = document.getElementsByTagName("canvas")[0];

  Asteroids.yDim = window.innerHeight;
  Asteroids.xDim = window.innerWidth;


  canvasEl.height = window.innerHeight;
  canvasEl.width = window.innerWidth;

  Asteroids.ctx = canvasEl.getContext("2d");

  Asteroids.Util = {};
  Asteroids.Util.inherits = function (ChildClass, ParentClass) {
    function Surrogate (){}
    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate();
  };
})();
