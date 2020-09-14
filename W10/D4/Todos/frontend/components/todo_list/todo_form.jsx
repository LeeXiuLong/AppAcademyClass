import React from 'react';
import uniqueId from '../../util/utils';
// const TodoForm = (props) => {
//     return <h1> this is a form </h1>
// }


class TodoForm extends React.Component {
    constructor (props) {
        super(props)
        this.state = {
            title: '',
            body: ''
        };

        this.submitForm = this.submitForm.bind(this);
        this.handleChange = this.handleChange.bind(this);

    }

    handleChange ({target}) {
        this.setState({
            [target.name]: target.value
        })
        console.log(this.state);

    }

    submitForm () {
        const todo = {
            id: uniqueId(),
            title: this.state.title,
            body: this.state.body,
            done: false
        }
        this.props.receiveTodo(todo);
    }

    render (){
        return (
        <div>
            <h1> Make a New Todo: </h1>

            <label>Title
                <input type="text" 
                name='title'
                onChange={this.handleChange}
                
                />
            </label>

            <label>Body
                <input type="text" 
                name='body'
                onChange={this.handleChange}
                />
            </label>

            <button onClick={this.submitForm} >Submit</button>
        </div>



        )
    }
}

export default TodoForm;

