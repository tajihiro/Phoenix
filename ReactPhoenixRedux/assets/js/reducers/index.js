import { combineReducers } from "redux";
import { connectRouter } from "connected-react-router";

import { page01Reducer } from "./page01Reducer";
import { page04Reducer } from "./page04Reducer";

const rootReducer = (history) => combineReducers({
    router: connectRouter(history), //Router
    page01Reducer, page04Reducer    //Reducer
});

export default rootReducer;
