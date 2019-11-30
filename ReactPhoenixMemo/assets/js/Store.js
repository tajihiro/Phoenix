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
        case 'FIND':
            return findReduce(state, action);
        case 'DELETE':
            return deleteReduce(state, action);
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

function findReduce(state, action){
    let f = action.find;
    let fdata = [];
    state.data.forEach((value) => {
            if(value.message.indexOf(f) >= 0){
                fdata.push(value);
            }
        });
    return{
        data: state.data,
        message: 'find "' + f + '":',
        mode: 'find',
        fdata: fdata
    };
}

function deleteReduce(state, action) {
    let newdata = state.data.slice();
    newdata.splice(action.index, 1);
    return{
        data: newdata,
        message: 'delete "' + action.index + '":',
        mode: 'delete',
        fdata:[]
    }
}

export function addMemo(text) {
    return {
        type: 'ADD',
        message: text
    }
}

export function findMemo(text){
    return{
        type: 'FIND',
        find: text
    }
}

export function deleteMemo(num){
    return{
        type: 'FIND',
        index: num
    }
}

export default createStore(memoReducer);