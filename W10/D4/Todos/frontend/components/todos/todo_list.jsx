import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';


const TodoList = (props) =>{
    const todos = props.todos.map(todo => {
        return <TodoListItem receiveTodo={props.receiveTodo} removeTodo={props.removeTodo} key={todo.id} todo={todo}/>
    })
    return(
        <div>
            <ol>
                {todos}
            </ol>
                <TodoForm receiveTodo={props.receiveTodo}/>
                
        </div>
    );
}

export default TodoList;
