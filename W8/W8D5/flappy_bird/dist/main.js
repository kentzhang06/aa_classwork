/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./src/bird.js":
/*!*********************!*\
  !*** ./src/bird.js ***!
  \*********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ Bird)\n/* harmony export */ });\nconst CONSTANTS = {\r\n  GRAVITY:  0.8,\r\n  FLAP_SPEED:  -8,\r\n  TERMINAL_VEL:  12,\r\n  BIRD_WIDTH:  40,\r\n  BIRD_HEIGHT:  30\r\n};\r\n\r\nclass Bird {\r\n  constructor(dimensions) {\r\n    // this.dimensions = dimensions;\r\n    this.x = dimensions.width/3;\r\n    this.y = dimensions.height/2;\r\n    this.velocity = 0;\r\n  }\r\n\r\n  drawBird(ctx) {\r\n    ctx.fillStyle = \"red\";\r\n    ctx.fillRect(this.x, this.y, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);\r\n  }\r\n\r\n  animate(context) {\r\n    this.move();\r\n    this.drawBird(context);\r\n  }\r\n\r\n  move() {\r\n    this.velocity += this.y;\r\n    this.velocity += CONSTANTS.GRAVITY;\r\n  }\r\n\r\n  flap() {\r\n    this.velocity = CONSTANTS.FLAP_SPEED;\r\n  }\r\n}\n\n//# sourceURL=webpack:///./src/bird.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ FlappyBird)\n/* harmony export */ });\n/* harmony import */ var _bird__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./bird */ \"./src/bird.js\");\n/* harmony import */ var _level__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./level */ \"./src/level.js\");\n\n\n\nclass FlappyBird {\n  constructor(canvas){\n    this.ctx = canvas.getContext(\"2d\");\n    this.dimensions = { width: canvas.width, height: canvas.height };\n    this.restart();\n  }\n\n  animate(level, myBird) {\n    level.drawBackground(this.ctx);\n    myBird.animate(this.ctx);\n    if (this.running) {\n      requestAnimationFrame(this.animate);\n    }\n  }\n\n  restart() {\n    this.running = false;\n    this.myLevel = new _level__WEBPACK_IMPORTED_MODULE_1__.default(this.dimensions);\n    this.myBird = new _bird__WEBPACK_IMPORTED_MODULE_0__.default(this.dimensions);\n    this.animate(this.myLevel, this.myBird);\n\n  }\n\n  play() {\n    this.running = true;\n    this.animate(this.myLevel, this.myBird);\n  }\n}\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _game__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\n\ndocument.addEventListener(\"DOMContentLoaded\", function(){\n  const canvas = document.getElementById('bird-game');\n  let newGame = new _game__WEBPACK_IMPORTED_MODULE_0__.default(canvas);\n  newGame.restart();\n  newGame.play();\n});\n\n// const canvas = document.getElementById('bird-game');\n// let newGame = new FlappyBird(canvas);\n// newGame.restart();\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/level.js":
/*!**********************!*\
  !*** ./src/level.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (/* binding */ Level)\n/* harmony export */ });\nclass Level {\n  constructor(dimensions) {\n    this.dimensions = dimensions;\n  }\n\n  drawBackground(ctx) {\n    ctx.fillStyle = \"skyblue\";\n    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);\n  }\n}\n\n//# sourceURL=webpack:///./src/level.js?");

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
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
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