class View {
  constructor(game, container) {
    this.game = game;
    this.container = container;
  }

  bindEvents() {
    $('.board').on('click','.cell',e => {
      const currentCell = $(e.currentTarget);
      this.makeMove(currentCell);
    })
    $('.board').on('click', '.clicked-cell', e => {
        alert("This is an invalid move");
        return;
    })
  }

  makeMove(currentCell) {
    currentCell.removeClass("cell");
    currentCell.addClass("clicked-cell");
    currentCell.append(this.game.currentPlayer);
    this.game.playMove(currentCell.data('pos'));
    if(this.game.isOver()){
      const $gameOverMessage = $('<h2>');
      if (this.game.winner()) {
        $gameOverMessage.append(`Congratulations ${this.game.winner().toUpperCase()} you have won the game!`);
      } else {
        $gameOverMessage.append(`Tie game :-(`);
      }
      this.container.append($gameOverMessage);
    }
  }

  setupBoard() {
    const $newUl = $('<ul>');
    $newUl.addClass("board");
    let i = 0;
    while(i < 3) {
      let j = 0;
      while(j < 3) {
        let $newLi = $('<li>');
        $newLi.data('pos', [i, j]);
        $newLi.addClass("cell");
        $newUl.append($newLi);
        j++;
      }
      i++;
    } 
    this.container.append($newUl)
  }
}


module.exports = View;
