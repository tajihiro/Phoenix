import React from 'react';
import ReactDOM from 'react-dom';
import {createStore, combineReducers} from 'redux';
import {Provider} from 'react-redux';
import Main from './Main'

let state_value = {
    counter : 0,
    message : "COUNTER"
}

function counter(state = state_value, action){
    return state;
}

let store = createStore(counter);

ReactDOM.render(
    <Provider store={store} >
        <Main/>
    </Provider>,
    document.getElementById('root')
);