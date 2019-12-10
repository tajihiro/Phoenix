const initData = {
    authenticated: false
}

export function page08Reducer(state = initData, action){
    console.log(action.type)
    switch (action.type) {
        case 'LOGIN':
            return login(state, action);
        default:
            return state;
    }
}

function login(state, action){
    let email = action.params.email;
    let passwd = action.params.passwd;
    if((email == 'tajima@blowfish.co.jp') && (passwd == '123')){
        return {authenticated: true}
    }else{
        return {authenticated: false}
    }
}
