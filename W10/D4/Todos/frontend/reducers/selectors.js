const allTodos = (state) => {
    return Object.values(state.todos);
}

window.allTodos = allTodos;

export default allTodos;
