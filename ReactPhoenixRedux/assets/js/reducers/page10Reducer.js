const initData = {
    member_id: 0,
    members: []
}

export function page10Reducer(state = initData, action){
    switch (action.type) {
        case 'GET_MEMBERS':
            return {
                member_id: action.member_id,
                members: action.members
            };
        case 'GET_MEMBERS_ERROR':
            return state;
        default:
            return state;
    }
}
