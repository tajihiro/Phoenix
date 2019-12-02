import {createStore} from "redux";

const initData = {
    message: 'こんにちは。Reduxの勉強をしています。'
};

export function appReducer(state = initData, action) {
    switch (action.type) {
        case 'INIT':
            return {
                message: "INIT"
            }
        default:
            return state;
    }
}

export default createStore(appReducer);