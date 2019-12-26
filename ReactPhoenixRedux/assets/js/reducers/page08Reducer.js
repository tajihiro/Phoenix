import { login } from '../actions/loginAction'
const initData = {
    authenticated: false
}

export function page08Reducer(state = initData, action){
    switch (action.type) {
        case 'LOGIN':
            return state;
        case 'AUTHENTICATED':
            return {
                authenticated: true,
                member: action.member
            };
        case 'LOGOUT':
            return {
                authenticated: false,
                member: ''
            };
        default:
            return state;
    }
}


