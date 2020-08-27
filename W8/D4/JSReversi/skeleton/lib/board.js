let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);
  for(let i = 0; i < grid.length; i++){
    grid[i] = new Array(8);
  }
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if(pos[0] > 7 || pos[1] > 7){
    return false;
  } else if (pos[0] < 0 || pos[1] < 0){
    return false;
  }
  return true;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  const piece = this.getPiece(pos);
  if(piece){
    return piece.color === color;
  }else{
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  const piece = this.getPiece(pos);
  if(piece){
    return true;
  }else{
    return false;
  }
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
    //if pieces to flip is undefined then we make it into a empty array
    if(!piecesToFlip){
      piecesToFlip = [];
    }

    // let oppColor = (color === "white") ? "black" : "white";
    //get the next position we will be moving to
    let newPos = [pos[0] + dir[0], pos[1] + dir[1]]
    //if the next position we are moving to is invalid, is empty or is the same color as our original position and directly next to it we return an empty array.
    if(!this.isValidPos(newPos) || !this.isOccupied(newPos) || (piecesToFlip === [] && this.isMine(newPos, color))){
        return [];
    //else if the color is the same as our original but there are pieces in our pieces to flip then we return our pieces to flip array    
    }else if(this.isMine(newPos, color)){
        return piecesToFlip;
    }
    //else if the piece is a different color from original positon then we add it to the pieces to flip and continue.
    else {
      piecesToFlip.push(newPos);
      return this._positionsToFlip(newPos, color, dir, piecesToFlip);
    }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if(this.isOccupied(pos)){
    return false;
  }
  for(let i = 0; i < Board.DIRS.length; i++){
    if(this._positionsToFlip(pos, color, Board.DIRS[i]).length !== 0){
     return true; 
    }
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if(!this.validMove(pos, color)){
    throw new Error("Invalid Move");
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);
  for(let i = 0; i < Board.DIRS.length; i++){
    let toBeFlipped = this._positionsToFlip(pos, color, Board.DIRS[i])
    for(let j = 0; j < toBeFlipped.length; j++){
      this.getPiece(toBeFlipped[j]).flip();
    }
  }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  newArr = [];
  for(let i = 0; i < this.grid.length; i++){
    for(let j = 0; j < this.grid[i].length; j++){
      if(this.validMove([i,j], color))
          newArr.push([i,j]);
    }
  }
  return newArr;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return !(this.validMoves(color).length === 0);
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return (!this.hasMove("white") && !this.hasMove("black"));
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for(let i = 0; i < 8; i++){
      let newStr = " " + i + "|";
    for(let j = 0; j< 8; j++){
      let element = this.grid[i][j] ? this.grid[i][j] : "-"
      newStr += " " + element;
    }
    console.log(newStr)
  }
};



module.exports = Board;

board = new Board();

