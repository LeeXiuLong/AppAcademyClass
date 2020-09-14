// const MovingObject = require('./moving_object.js');
// const Asteroid = require('./asteroid.js');
const GameView = require('./game_view.js');
// console.log(typeof MovingObject);

// window.MovingObject = MovingObject;
// window.Asteroid = Asteroid;
// window.Game = Game;

document.addEventListener("DOMContentLoaded", () => {
const canEle = document.getElementById("game-canvas");
const ctx = canEle.getContext("2d");

ctx.fillStyle = "black";
ctx.fillRect(0, 0, 700, 900);

const game = new GameView(ctx);
console.log(game);
game.start();
    

// let asteroid = new Asteroid({ pos: [250, 250]});
// console.log(asteroid);
// asteroid.draw(ctx);
//     setInterval(function(){
//         asteroid.move(ctx);
//         ctx.clearRect(0, 0, canEle.width, canEle.height)
//         ctx.fillStyle = "black";
//         ctx.fillRect(0, 0, 700, 900);
//         asteroid.draw(ctx);
//     }, 100)
});
