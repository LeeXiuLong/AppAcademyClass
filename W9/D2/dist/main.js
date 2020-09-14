/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const CONSTANTS = {COLOR: \"lightgreen\", RADIUS:20};\nconst utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\n\nfunction Asteroid(options){\n    \n    this.color = CONSTANTS.COLOR;\n    this.radius = CONSTANTS.RADIUS;\n    this.pos = options.pos;\n    this.vel = utils.randomVec(30);\n\n}\n\n\nutils.inherits(Asteroid, MovingObject)\n\n\nmodule.exports = Asteroid ;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst DIM_X = 900;\nconst DIM_Y = 700;\nconst NUM_ASTEROIDS = 10;\n\nfunction Game(){\n    this.asteroids = this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function (){\n    let asteroids = [];\n    let i = 0;\n    while(i < NUM_ASTEROIDS){\n        i++;\n        let ast = new Asteroid({pos: this.randomPosition()})\n        asteroids.push(ast);\n    }\n    return asteroids;\n}\n\nGame.prototype.randomPosition = function(){\n    return [Math.floor(Math.random(700)), Math.floor(Math.random(700))]\n}\n\n\nGame.prototype.draw = function(ctx){\n    \n    this.asteroids.forEach((asteroid) => {\n        asteroid.draw(ctx);\n        ctx.clearRect(0, 0, ctx.height, ctx.width);\n    });\n}\n\nGame.prototype.moveObjects = function(){\n    this.asteroids.forEach((asteroid) => {\n        console.log(asteroid);\n        asteroid.move();\n    });\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx){\n    this.game = new Game();\n    this.context = ctx;\n    console.log(this.game)\n}\n\nGameView.prototype.start = function(){\n    let that = this\n    setInterval(function(){\n        that.game.moveObjects();\n        that.game.draw(that.context);\n    },100)\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// const MovingObject = require('./moving_object.js');\n// const Asteroid = require('./asteroid.js');\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n// console.log(typeof MovingObject);\n\n// window.MovingObject = MovingObject;\n// window.Asteroid = Asteroid;\n// window.Game = Game;\n\ndocument.addEventListener(\"DOMContentLoaded\", () => {\nconst canEle = document.getElementById(\"game-canvas\");\nconst ctx = canEle.getContext(\"2d\");\n\nctx.fillStyle = \"black\";\nctx.fillRect(0, 0, 700, 900);\n\nconst game = new GameView(ctx);\nconsole.log(game);\ngame.start();\n    \n\n// let asteroid = new Asteroid({ pos: [250, 250]});\n// console.log(asteroid);\n// asteroid.draw(ctx);\n//     setInterval(function(){\n//         asteroid.move(ctx);\n//         ctx.clearRect(0, 0, canEle.width, canEle.height)\n//         ctx.fillStyle = \"black\";\n//         ctx.fillRect(0, 0, 700, 900);\n//         asteroid.draw(ctx);\n//     }, 100)\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options){\n    if(options.pos) {this.pos = options.pos;}\n    if(options.vel) {this.vel = options.vel;}\n    if(options.radius) {this.radius = options.radius;}\n    if(options.color) {this.color = options.color;}\n}\n\nMovingObject.prototype.draw = function(ctx){\n    ctx.beginPath();\n    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n    ctx.strokeStyle = this.color;\n    ctx.stroke();\n    ctx.fillStyle = this.color;\n    ctx.fill();\n    \n}\n\nMovingObject.prototype.move = function(){\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n}\n\n\n\nmodule.exports = MovingObject ;\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        const Surrogate = function Surrogate(){};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.constructor = childClass;\n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n\n    \n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });