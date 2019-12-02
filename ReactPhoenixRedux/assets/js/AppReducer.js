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

// export function changeMessage(message) {
//     return{
//         type: 'CHANGE',
//         message: message
//     }
// }

export default createStore(appReducer);