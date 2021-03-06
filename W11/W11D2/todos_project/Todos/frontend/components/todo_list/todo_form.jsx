import React from "react"
import uniqueId from "../../util/util";

class TodoForm extends React.Component {
    constructor(props){
        super(props);

        this.state = {
            id: uniqueId(),
            title: "",
            body: "",
            done: false
        }
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    updateTitle(e) {
        this.setState({ title: e.target.value})
    }

    updateBody(e){
        this.setState({ body: e.target.value })
    }

    handleSubmit(e) {
        e.preventDefault();
        // this.props.receiveTodo(this.state);
        this.props.createTodo(this.state)
          .then(
            () => {
              this.setState({title: '', body: ''});
              this.props.clearErrors();
            },
            err => this.setState({title: err.errors, body: err.errors})
          );

    }

    render(){
        return (
            <form onSubmit={this.handleSubmit}>
                <h2>Add Todo</h2>
                <label>Title:
                    <input type="text" value={this.state.title} onChange={this.updateTitle} />
                </label>

                <label>Body:
                    <input type="text" value={this.state.body} onChange={this.updateBody} />
                </label>
                <button>Submit</button>
            </form>

        )
    }
}

export default TodoForm;