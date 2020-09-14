const Asteroid = require("./asteroid.js");
const DIM_X = 900;
const DIM_Y = 700;
const NUM_ASTEROIDS = 10;

function Game(){
    this.asteroids = this.addAsteroids();
}

Game.prototype.addAsteroids = function (){
    let asteroids = [];
    let i = 0;
    while(i < NUM_ASTEROIDS){
        i++;
        let ast = new Asteroid({pos: this.randomPosition()})
        asteroids.push(ast);
    }
    return asteroids;
}

Game.prototype.randomPosition = function(){
    return [Math.floor(Math.random(700)), Math.floor(Math.random(700))]
}


Game.prototype.draw = function(ctx){
    
    this.asteroids.forEach((asteroid) => {
        asteroid.draw(ctx);
        ctx.clearRect(0, 0, ctx.height, ctx.width);
    });
}

Game.prototype.moveObjects = function(){
    this.asteroids.forEach((asteroid) => {
        console.log(asteroid);
        asteroid.move();
    });
}

module.exports = Game;