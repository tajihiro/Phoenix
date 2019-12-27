const initData = {
    comments: [],
    isLoading: false,
    hasError: false
}

export function page11Reducer(state = initData, action){
    console.log("11:" + action.type)
    switch (action.type) {
        case '':
            return state;
        default:
            return state;
    }
}
