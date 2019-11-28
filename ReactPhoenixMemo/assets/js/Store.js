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
        case 'ADD':
            return addReduce(state, action);
        default:
            return state;
    }
}

function addReduce(state, action) {
    let data = {
        message: action.message,
        created: new Date()
    };
    let newdata = state.data.slice();
    newdata.unshift(data);
    return {
        data: newdata,
        message: 'Added!! ',
        mode: 'default',
        fdata: []
    };
}
export function addMemo(text) {
    return {
        type: 'ADD',
        message: text
    }
}


export default createStore(memoReducer);