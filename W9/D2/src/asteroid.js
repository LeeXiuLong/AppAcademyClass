const CONSTANTS = {COLOR: "lightgreen", RADIUS:20};
const utils = require("./utils.js");
const MovingObject = require("./moving_object.js");


function Asteroid(options){
    
    this.color = CONSTANTS.COLOR;
    this.radius = CONSTANTS.RADIUS;
    this.pos = options.pos;
    this.vel = utils.randomVec(30);

}


utils.inherits(Asteroid, MovingObject)


module.exports = Asteroid ;