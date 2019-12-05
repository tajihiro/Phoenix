const initData = {
    comments: [],
    isLoading: false,
    hasError: false
}

export function page01Reducer(state = initData, action){
    console.log('Reducer : ' + state);
    switch (action.type) {
        case '':
            return state;
        default:
            return state;
    }
}
