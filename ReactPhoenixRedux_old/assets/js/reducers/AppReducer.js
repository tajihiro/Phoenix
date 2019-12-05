import {createStore, combineReducers, applyMiddleware} from "redux";

const initData = {
    message: 'こんにちは。Reduxの勉強をしています。'
};

export function appReducer(state = initData, action) {
    switch (action.type) {
        case 'CHANGE':
            return {
                message: action.message
            }
        default:
            return state;
    }
}
