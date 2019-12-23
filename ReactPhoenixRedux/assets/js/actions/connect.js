import axios from 'axios';

export function getServerList(){
    axios.get('/api/members')
        .then(function (response) {
            // handle success
            let data = response.data;
            let members = data.data;
            console.log(members);
            let action = {
                type: 'AUTHENTICATED',
                member_id: 0,
                members: members,
            };
            // props.dispatch(action);
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