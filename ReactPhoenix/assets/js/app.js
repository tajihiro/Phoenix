// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import React from 'react';
import ReactDOM from 'react-dom';
import {createStore, combineReducers} from 'redux';
import {Provider} from 'react-redux';

import App from './components/App'

let init_value ={
    counter: 0,
    message: 'COUNTER'
}

//Reducer
function counter(state = init_value, action){
    switch (action.type) {
        case 'INCREMENT':
            return {
                counter: state.counter + 1,
                message: '増加'
            };
        case 'DECREMENT':
            return {
                counter: state.counter - 1,
                message: '減少'
            };
        default:
            return state;
    }
}

//Store
let store = createStore(counter);

//Rendering
ReactDOM.render(
    <Provider store={store}>
        <App />
    </ Provider >,
    document.getElementById('root')
);
