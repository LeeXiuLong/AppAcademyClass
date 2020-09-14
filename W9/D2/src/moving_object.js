function MovingObject(options){
    if(options.pos) {this.pos = options.pos;}
    if(options.vel) {this.vel = options.vel;}
    if(options.radius) {this.radius = options.radius;}
    if(options.color) {this.color = options.color;}
}

MovingObject.prototype.draw = function(ctx){
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.strokeStyle = this.color;
    ctx.stroke();
    ctx.fillStyle = this.color;
    ctx.fill();
    
}

MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
}



module.exports = MovingObject ;

