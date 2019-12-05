import { combineReducers } from "redux";
import { connectRouter } from "connected-react-router";

import {page01Reducer} from "./page01Reducer";


const rootReducer = (history) => combineReducers({
    router: connectRouter(history), //Router
    sampleReducer: page01Reducer //Reducer
});

export default rootReducer;
