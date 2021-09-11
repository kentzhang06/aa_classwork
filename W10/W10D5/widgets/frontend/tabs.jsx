import React from "react";

class Tabs extends React.Component {
    constructor(props) {
        super(props)
        // this.list = [
        //     { title: "t1", content: "c1"}, 
        //     { title: "t2", content: "c2"}
        // ]
        this.state = {
            selectedTabIndex: 0
        }
        this.updateTabIndex = this.updateTabIndex.bind(this)
    }

    updateTabIndex(i) {
        this.setState({selectedTabIndex: i})
    }

    render() {
        return (
            <div className = "tab">
                <ul>
            {this.props.tabs.map((tab, i) =>
                <h1 id = {i} onClick={()=>this.updateTabIndex(i)} key={i}>{tab.title}</h1>
                )}
                </ul>
            <article>{this.props.tabs[this.state.selectedTabIndex].content}</article>
            </div>
        )
    }
}

export default Tabs;