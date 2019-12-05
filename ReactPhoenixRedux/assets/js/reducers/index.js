import { combineReducers } from "redux";
import { connectRouter } from "connected-react-router";

import {sampleReducer} from "./sampleReducer";


const rootReducer = (history) => combineReducers({
    router: connectRouter(history), //Router
    sampleReducer //Reducer
});

export default rootReducer;
