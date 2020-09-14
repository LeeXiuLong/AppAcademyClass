import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/todo_actions';

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (state =initialState, action) =>{
    Object.freeze(state);

    let newState;
    switch(action.type){

        case RECEIVE_TODO:
            newState = Object.assign({}, state);
            newState[action.todo.id] = action.todo; //refactor potensh
            return newState;

            

        case RECEIVE_TODOS:
            newState = {};
            action.todos.forEach( todo => {
                newState[todo.id] = todo;
            })
            return newState;
            
        case REMOVE_TODO:
            newState = Object.assign({}, state);
            delete newState[action.todo.id]
            return newState;
            
        default:
            return state;
    }
};

export default todosReducer;

  // merge old state and newItem into new state object
  //const newState = Object.assign( 
    //{}, // target object, blank slate to merge everything into, will be return value of `Object.assign()`
    //state, // first 2 args together essentially create copy of state
    //newItem // add newItem properties to our target object (or override previous properties of same name from old state)
  //);

  