import { combineReducers } from 'redux';
import { connectRouter } from 'connected-react-router';
import { reducer as formReducer } from 'redux-form';

import { page01Reducer } from "./page01Reducer";
import { page04Reducer } from "./page04Reducer";

const rootReducer = (history) => combineReducers({
    router: connectRouter(history), //Router
    page01: page01Reducer, page04: page04Reducer,    //Reducers
    form: formReducer
});

export default rootReducer;
