import axios from "axios";

const initData = {
    disp: 'input',
    member: ''
}

export function page04Reducer(state = initData, action){
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
        case 'COMPLEATE':
            register(state, action);
            return{
                ...state,
                disp: 'compleate'
            };
        default:
            return {disp: 'input'};
    }
}

function register(state, action) {
    let last_name = state.member.last_name;
    let first_name = state.member.first_name;
    let email = state.member.email;
    let passwd = state.member.passwd;

    axios.post('/api/members', { member: {"last_name":last_name,"first_name":first_name,"email":email,"passwd":passwd}})
        .then(function (response) {
            // handle success
            console.log(response.data);
            let data = response.data;
        })
        .catch(function (error) {
            // handle error
            console.log(error);
            // self.setState({hasError: true });
        })
        .finally(function () {
            // always executed
        });
}
