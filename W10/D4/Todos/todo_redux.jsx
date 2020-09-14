import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store';
import { receiveTodo, receiveTodos } from './frontend/actions/todo_actions';
import App from './frontend/components/app';
import Root from './frontend/components/root';
import allTodos  from './frontend/reducers/selectors';



document.addEventListener("DOMContentLoaded", () => {

    ReactDOM.render(<Root store={store}/>, document.getElementById('root'))
})

const store = configureStore();
window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;

