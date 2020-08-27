const readline = require("readline");
const Piece = require("./piece.js");
const Board = require("./board.js");

/**
 * Sets up the game with a board and the first player to play a turn.
 */
function Game () {
  this.board = new Board();
  this.turn = "black";
};

/**
 * Flips the current turn to the opposite color.
 */
Game.prototype._flipTurn = function () {
  this.turn = (this.turn == "black") ? "white" : "black";
};

// Dreaded global state!
let rlInterface;

/**
 * Creates a readline interface and starts the run loop.
 */
Game.prototype.play = function () {
  rlInterface = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: false
  });

  this.runLoop(function () {
    rlInterface.close();
    rlInterface = null;
  });
};

/**
 * Gets the next move from the current player and
 * attempts to make the play.
 */
  Game.prototype.playTurn = function (callback) {
    this.board.print();
    let pos = undefined;
    if(this.turn === "black"){
      rlInterface.question(
        `${this.turn}, where do you want to move?`,
        handleResponse.bind(this)
      );

      function handleResponse(answer) {
        pos = JSON.parse(answer);
        if (!this.board.validMove(pos, this.turn)) {
          console.log("Invalid move!");
          this.playTurn(callback);
          return;
        }
        this.board.placePiece(pos, this.turn);
        this._flipTurn();
        callback();
      }

    }else{
     console.log("AI Attacks!!");
     let pos = this.computerTurn(this.board);
     this.board.placePiece(pos, this.turn);
     this._flipTurn();
     callback();
    }
  }

  Game.prototype.computerTurn = function (board){
    //moves is an array of all the valid moves for white
    moves = board.validMoves("white");
    //we set our max move and max sum values to defualts of the first element of valid moves and 0;
    let maxMove = moves[0];
    let maxSum = 0;
    //for every single move in valid moves
    for(let i = 0; i < moves.length; i++){
      //declare our sum value
      let sum = 0;
      //for every single direction in this move
      for(let j = 0; j < Board.DIRS.length; j++){
        //add the number of flipped pieces to our sum value
        sum += board._positionsToFlip(moves[i], "white", Board.DIRS[j]).length;
        //if our sum value is greater than our current current maxSum then we reset those values to the current sum and its corresponding move.
        if (sum > maxSum){
          maxSum = sum;
          maxMove = moves[i];
        }
      }
    }
    //return the move that flips the most amount of coins
    return maxMove;
  }

/**
 * Continues game play, switching turns, until the game is over.
 */
Game.prototype.runLoop = function (overCallback) {
  if (this.board.isOver()) {
    console.log("The game is over!");
    overCallback();
  } else if (!this.board.hasMove(this.turn)) {
    console.log(`${this.turn} has no move!`);
    this._flipTurn();
    this.runLoop();
  } else {
    this.playTurn(this.runLoop.bind(this, overCallback));
  }
};

module.exports = Game;
