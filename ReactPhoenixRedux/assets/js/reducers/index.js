import { combineReducers } from 'redux';
import { connectRouter } from 'connected-react-router';
import { reducer as formReducer } from 'redux-form';

import { page01Reducer } from "./page01Reducer";
import { page04Reducer } from "./page04Reducer";
import { page06Reducer } from "./page06Reducer";
import { page07Reducer } from "./page07Reducer";
import { page08Reducer } from "./page08Reducer";
import { page10Reducer } from "./page10Reducer";
import { page11Reducer } from "./page11Reducer";


const rootReducer = (history) => combineReducers({
    router: connectRouter(history), //Router
    page01: page01Reducer, page04: page04Reducer,
    page06: page06Reducer, page07: page07Reducer,
    page08: page08Reducer, page10: page10Reducer,
    page11: page11Reducer, //Reducers
    form: formReducer
});

export default rootReducer;
