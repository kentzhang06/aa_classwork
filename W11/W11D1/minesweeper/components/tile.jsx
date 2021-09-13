import React from 'react'
import * as Minesweeper from "../minesweeper.js";


class Tile extends React.Component {
    constructor(props) {
        super(props)

        this.handleClick = this.handleClick.bind(this)

    }

    handleClick(e) {
        let flagged = false
        if (e.altKey) {
            flagged = true
        }
        this.props.updateGame(this.props.tile, flagged)
    }

    render () {
        let tile = this.props.tile
        let content = <div></div>
        if (tile.bombed && tile.explored) {
            content = <div className="bomb">&#x1F4A3;</div>
        } else if (tile.explored) {
            let bombCount = tile.adjacentBombCount()
            if (bombCount > 0) {
                content = <div className="reveal">{bombCount}</div>
            } else {
                content = <div className="empty"></div>
            }
        } else if (tile.flagged) {
            content = <div className="flag">&#9873;</div>
        }
        return (
        <div className="tile" onClick={this.handleClick}>
            {content}
        </div>
        )
    }
}

export default Tile;