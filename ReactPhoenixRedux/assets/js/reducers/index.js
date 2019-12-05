import { combineReducers } from "redux";
import { connectRouter } from "connected-react-router";

const initData = {
    data: []
}

function sampleReducer(state = initData, action){
    switch (action.type) {
        case '':
            return state;
        default:
            return state;
    }
}

const rootReducer = (history) => combineReducers({
    router: connectRouter(history), //Router
    sampleReducer //Reducer
});

export default rootReducer;
