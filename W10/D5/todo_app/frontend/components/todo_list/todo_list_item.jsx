import React from 'react';

class TodoListItem extends React.Component{ 
    constructor(props){
        super(props)
        this.deleteTodo = this.deleteTodo.bind(this)
        this.toggleDone = this.toggleDone.bind(this)   
    }

    deleteTodo() {
        this.props.removeTodo(this.props.todo);
    }

    toggleDone() {
        const newTodo = Object.assign({}, this.props.todo)
        newTodo.done = newTodo.done ? false : true;
        this.props.receiveTodo(newTodo);
    }

    todoButtonLabel () {
        return this.props.todo.done ? 'uncheck' : 'check';
    }

    render () {

        let status = this.props.todo.done ? '☑' : '☐';
        return (
            <li key={this.props.todo.id}>
                    <h1>{this.props.todo.title}</h1>
                    <p>{this.props.todo.body + ' ' + status} </p>
                    <button onClick={this.toggleDone}>{this.todoButtonLabel()}</button>
                    <button onClick={this.deleteTodo}>Delete Todo</button>
            </li>
            );
        }
        
}
    


export default TodoListItem;
