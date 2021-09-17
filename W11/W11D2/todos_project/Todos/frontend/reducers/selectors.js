export const allTodos = (state) => {
  return Object.values(state.todos);
}

export const stepsByTodoId = (state, todoId) => {
  const arr = Object.values(state.steps);
  const result = [];

  arr.forEach((step) => {
    if(step.todo_id === todoId) {
      result.push(step);
    }
  });

  return result;
}
