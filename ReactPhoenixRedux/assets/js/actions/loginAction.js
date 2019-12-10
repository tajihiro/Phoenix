import axios from "axios";

export function login(props, email, passwd){
    axios.get('/api/member/login/' + email + '/' + passwd)
        .then(function (response) {
            // handle success
            let data = response.data;
            let action = {
                type: 'AUTHENTICATED',
                member: data,
                authenticated: true
            };
            props.dispatch(action);
        })
        .catch(function (error) {
            // handle error
            console.log(error);
            return {
                authenticated: false
            };
        })
        .finally(function () {
            // always executed
        });
}