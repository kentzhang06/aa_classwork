import { connect } from "react-redux";
import {stepsByTodoId} from "../../reducers/selectors";
import StepList from "./step_list";

export const mapStateToProps = (state) => {
  return {
    steps: stepsByTodoId(state, state.todo_id),
    todo_id: state.todo_id
  }
}

export const mapDispatchToProps = (dispatch) => {
  return {
    receiveStep: (step) => dispatch(receiveStep(step))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(StepList);