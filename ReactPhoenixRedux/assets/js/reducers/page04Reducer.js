const initData = {
    disp: 'input',
    member: ''
}

export function page04Reducer(state = initData, action){
    console.log(action.type)
    switch (action.type) {
        case 'INPUT':
            return {
                disp: 'input'
            };
        case 'CONFIRM':
            return{
                disp: 'confirm',
                member: action.params
            };
        default:
            return {disp: 'input'};
    }
}
