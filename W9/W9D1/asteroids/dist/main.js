/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\r\nconst Utils = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\r\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\r\n\r\nfunction Asteroid(pos, game) {\r\n  this.COLOR = \"#DDA0DD\";\r\n  this.RADIUS = 20;\r\n  this.pos = pos;\r\n  this.vel = [getRandomInt(-3, 3), getRandomInt(-3, 3)];\r\n  this.game = game;\r\n\r\n  MovingObject.call(this, { pos: this.pos, vel: this.vel, color: this.COLOR, radius: this.RADIUS, game: this.game } );\r\n}\r\n\r\nUtils.inherits(Asteroid, MovingObject);\r\n\r\n\r\nfunction getRandomInt(min, max) {\r\n  let result = 0;\r\n  while (!result) {\r\n    result = Math.random() * (max - min) + min;\r\n  }\r\n  return result;\r\n}\r\n\r\nAsteroid.prototype.collideWith = function (otherObject) {\r\n  if (otherObject instanceof Ship) {\r\n    otherObject.relocate();\r\n  }\r\n}\r\n\r\nmodule.exports = Asteroid;\r\n\r\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nmodule.exports = Game;\n\nfunction Game () {\n    this.DIM_X = 640;\n    this.DIM_Y = 640;\n    this.NUM_ASTEROIDS = 3;\n    this.asteroids = [];\n    this.addAsteroids();\n    this.ship = new Ship(this.randomPosition(), this);\n}\n\nGame.prototype.allObjects = function () {\n  return this.asteroids.concat([this.ship]);\n}\n\nGame.prototype.addAsteroids = function () {\n    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {\n        const ast = new Asteroid(this.randomPosition(), this);\n        this.asteroids.push(ast);\n    }    \n}\n\nGame.prototype.randomPosition = function () {\n    return [getRandomInt(this.DIM_X), getRandomInt(this.DIM_Y)];\n}\n\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);\n    let objects = this.allObjects();\n\n    for (let i = 0; i < objects.length; i++) {\n        objects[i].draw(ctx);\n    }\n}\n\nGame.prototype.moveObjects = function () {\n  let objects = this.allObjects();\n    for (let i = 0; i < objects.length; i++) {\n        objects[i].move();\n    }\n}\n\nGame.prototype.wrap = function(pos) {\n  let x = pos[0];\n  let y = pos[1];\n\n  if (x > this.DIM_X) {\n    x = 0;\n  }else if (x < 0) {\n    x = this.DIM_X;\n  }\n\n  if (y > this.DIM_Y) {\n    y = 0;\n  }else if (y < 0) {\n    y = this.DIM_Y;\n  }\n\n  return [x, y];\n}\n\nGame.prototype.checkCollisions = function () {\n  let objects = this.allObjects();\n    for (let i = 0; i < objects.length; i++) {\n        for (let j = i+1; j < objects.length; j++) {\n            if (objects[i].isCollidedWith(objects[j])) {\n                objects[i].collideWith(objects[j]);\n            }\n        }\n    }\n}\n\nGame.prototype.step = function () {\n    this.moveObjects();\n    this.checkCollisions();\n}\n\nGame.prototype.remove = function (asteroid) {\n    let idx = this.asteroids.indexOf(asteroid);\n    this.asteroids.splice(idx, 1);\n}\n\n\n\nfunction getRandomInt(max) {\n    return Math.floor(Math.random() * max);\n}\n\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView (ctx) {\n    this.game = new Game();\n    this.ctx = ctx;\n\n\n}\n\nGameView.prototype.start = function () {\n    function drawAndMove () {\n        this.game.draw(this.ctx);\n        this.game.step();\n    }\n    setInterval(drawAndMove.bind(this), 20);\n    \n}\n\nmodule.exports = GameView;\n\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\");\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\nwindow.GameView = GameView;\nwindow.Ship = Ship;\n\ndocument.addEventListener(\"DOMContentLoaded\", function () {\n    const canvas = document.getElementById('game-canvas');\n    const ctx = canvas.getContext('2d');\n    const mo = new MovingObject({\n        pos: [30, 30],\n        vel: [10, 10],\n        radius: 5,\n        color: \"#00FF00\"\n    });\n\n    const newGame = new GameView(ctx);\n    newGame.start();\n    // const newGame = new Game();\n    // newGame.draw(ctx);\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject (vars) {\n    this.pos = vars['pos'];\n    this.vel = vars['vel'];\n    this.radius = vars['radius'];\n    this.color = vars['color'];\n    this.game = vars['game'];\n}\n\nMovingObject.prototype.draw = function(ctx) {\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0,\n        2 * Math.PI,\n        false\n    );\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function() {\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    this.pos = this.game.wrap(this.pos);\n}\n\nMovingObject.prototype.isCollidedWith = function (otherObject) {\n    let totalRadius = this.radius + otherObject.radius;\n    let x1 = otherObject.pos[0];\n    let y1 = otherObject.pos[1];\n    let x2 = this.pos[0];\n    let y2 = this.pos[1];\n\n    let dist = Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2));\n\n    return dist < totalRadius;\n}\n\n// MovingObject.prototype.collideWith = function (otherObject) {\n\n// }\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\r\nconst Utils = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\r\n\r\nmodule.exports = Ship;\r\n\r\nfunction Ship(pos, game) {\r\n  this.COLOR = \"#FF0000\";\r\n  this.RADIUS = 10;\r\n  this.vel = [0, 0];\r\n  this.pos = pos;\r\n  this.game = game;\r\n\r\n  MovingObject.call(this, { pos: this.pos, vel: this.vel, color: this.COLOR, radius: this.RADIUS, game: this.game } );\r\n\r\n}\r\nUtils.inherits(Ship, MovingObject);\r\n\r\nShip.prototype.relocate = function() {\r\n  this.pos = this.game.randomPosition();\r\n  this.vel = [0, 0];\r\n}\r\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("// Util.inherits = function(childClass, parentClass) {\r\n//   function Surrogate() {};\r\n//   Surrogate.prototype = parentClass.prototype;\r\n//   childClass.prototype = new Surrogate();\r\n//   childClass.prototype.constructor = childClass;\r\n// }\r\n\r\nconst Utils = {\r\n  inherits(childClass, parentClass) {\r\n    function Surrogate() {};\r\n    Surrogate.prototype = parentClass.prototype;\r\n    childClass.prototype = new Surrogate();\r\n    childClass.prototype.constructor = childClass;\r\n  }\r\n};\r\n\r\nmodule.exports = Utils;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;