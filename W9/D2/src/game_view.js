const Game = require('./game.js');

function GameView(ctx){
    this.game = new Game();
    this.context = ctx;
    console.log(this.game)
}

GameView.prototype.start = function(){
    let that = this
    setInterval(function(){
        that.game.moveObjects();
        that.game.draw(that.context);
    },100)
}

module.exports = GameView;