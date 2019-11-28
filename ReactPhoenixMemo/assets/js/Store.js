import {createStore} from "redux";

const initData = {
    data: [{message: 'Sample Data', created: new Date()}],
    message: 'Please type message : ',
    mode: 'default',
    fdata: []
};

//
// Reducer
//
export function memoReducer(state = initData, action) {
    switch (action.type) {
        case '':
            return state;
        default:
            return state;
    }
}

export default createStore(memoReducer);