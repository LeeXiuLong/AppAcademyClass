import React from 'react';
import Tile from './tile';

class Board extends React.Component{
    constructor(props) {
        super(props);
    }
    
    render() {
        const newBoard = this.props.board.grid.map((row, index) => {
            const newRow = row.map((tile, index) => {
                return <Tile tile={tile} updateGame={this.props.updateGame} key={index} />
            })
            return <div className="row" key={index}>{newRow}</div>
        })
        return (
            <div>
                {newBoard}
            </div>
        )
    }
}

export default Board;