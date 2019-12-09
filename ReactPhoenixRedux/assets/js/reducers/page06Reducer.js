const initData = {
    data: []
}

export function page06Reducer(state = initData, action){
    console.log(action.type)
    switch (action.type) {
        case 'DO_ENTER':
            return state;
        default:
            return state;
    }
}
