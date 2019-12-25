const initData = {
    team_id: 0,
    teams: [],
    member_id: 0,
    members: []
}

export function page10Reducer(state = initData, action){
    switch (action.type) {
        case 'GET_TEAMS':
            return {
                team_id: action.team_id,
                teams: action.teams,
                member_id: state.member_id,
                members: state.members
            };
        case 'GET_MEMBERS':
            return {
                team_id: state.team_id,
                teams: state.teams,
                member_id: action.member_id,
                members: action.members
            };
        case 'GET_TEAMS_ERROR':
            return state;
        case 'GET_MEMBERS_ERROR':
            return state;
        default:
            return state;
    }
}
