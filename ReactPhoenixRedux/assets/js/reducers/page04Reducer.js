const initData = {
    mode: 'input'
}

export function page04Reducer(state = initData, action){
    switch (action.type) {
        case 'INPUT':
            return {mode: 'input'};
        case 'CONFIRM':
            return {mode: 'confirm'};
        default:
            return state;
    }
}
