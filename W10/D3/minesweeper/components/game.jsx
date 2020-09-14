import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

class Game extends React.Component{

    constructor(props){
        super(props);

        this.state = {
            board: new Minesweeper.Board(6,1),
        }
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(tile, flagging){
        flagging ? tile.toggleFlag() : tile.explore();
        this.setState({ board: this.state.board });
    }

    render(){
        let winCondition;
        if(this.state.board.won()){
            winCondition = "You Won!"
        }else if(this.state.board.lost()){
            winCondition = "You Lost!"
        }
        return(
            <div>
                <h1>{winCondition}</h1>
                <br />
                <div className="game-board">
                    <Board board={this.state.board} updateGame={this.updateGame} />
                </div>
            </div>
        )
    }
}

export default Game;
