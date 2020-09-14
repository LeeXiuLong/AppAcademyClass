const View = require("./ttt-view.js");// require appropriate file
const Game = require("../solution/game.js");// require appropriate file


  $(function() {
    const container = $('.ttt') 
    let game = new Game();
    let view = new View(game, container);
    view.setupBoard();
    view.bindEvents();
  });

