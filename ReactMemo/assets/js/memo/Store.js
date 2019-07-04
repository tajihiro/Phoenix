import {createStore} from "redux";

const initData = {
    data: [{message: 'sample data', created: new Date()}],
    message: 'Please type message :',
    mode: 'default',
    fdata: []
};

export function memoReducer(state = initData, action) {
    return state;
}

export default createStore(memoReducer);
