import React from 'react';

class Tile extends React.Component{
    constructor(props){
        super(props);


        this.contentRender = this.contentRender.bind(this);
        this.clickedRender = this.clickedRender.bind(this);
    }
    
    contentRender() {
        if (this.props.tile.bombed && this.props.tile.explored) {
            return <p>&#128163;</p>
        } else if (this.props.tile.flagged) {
            return <p>&#128681;</p>
        } else if (this.props.tile.explored && this.props.tile.adjacentBombCount() > 0) {
            return <p>{this.props.tile.adjacentBombCount()}</p>;
        } else {
            return <p></p>;
        }
    }



    clickedRender(e){
        e.persist();
        let typeClick = "";
        e.altKey ? typeClick = "flag" : typeClick = "reveal";
        this.contentRender();

        let flagging = typeClick === "flag" ? true : false;
        this.props.updateGame(this.props.tile, flagging);
    }

    render(){
        let clicked = "tileNotClicked"
        if(this.props.tile.flagged || this.props.tile.explored){
            clicked = "tileClicked"
        }
        return (
            <div onClick ={this.clickedRender} className ={clicked} id="tile">
                {this.contentRender()}
            </div>
        )
    }
}

export default Tile;