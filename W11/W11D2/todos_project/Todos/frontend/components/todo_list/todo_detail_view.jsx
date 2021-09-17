import React from "react";
const TodoDetailView = (props) => {
  return (

    <ul>
      <h3>Details</h3>
      <li>Body: {props.todo.body}</li>
      <li>Done: {`${props.todo.done}`}</li>
      <br></br>
    </ul>
      
  )
}

export default TodoDetailView;