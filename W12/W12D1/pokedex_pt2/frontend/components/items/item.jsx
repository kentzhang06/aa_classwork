import React from 'react';

class Item extends React.Component{
    constructor(props){
        super(props);
    }

    render (){
        if(!this.props.item) return null;
        const img = this.props.item.imageUrl;
        console.log(img)
        console.log("item url")
        return (
            <li><img src={img} /></li>
        )
    }
}

export default Item;