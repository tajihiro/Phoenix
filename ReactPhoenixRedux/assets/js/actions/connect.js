import axios from 'axios';

export function getTeamList(props){
    axios.get('/api/teams')
        .then(function (response) {
            // handle success
            let teams = response.data.data;
            console.log(teams);
            let action = {
                type: 'GET_TEAMS',
                team_id: 2,
                teams: teams
            };
            props.dispatch(action);
        })
        .catch(function (error) {
            // handle error
            console.log(error);
            return {
                type: 'GET_TEAMS_ERROR'
            };
        })
        .finally(function () {
            // always executed
        });
}
export function getMemberList(props){
    axios.get('/api/members')
        .then(function (response) {
            // handle success
            let members = response.data.data;
            console.log(members);
            let action = {
                type: 'GET_MEMBERS',
                member_id: 22,
                members: members
            };
            props.dispatch(action);
        })
        .catch(function (error) {
            // handle error
            console.log(error);
            return {
                type: 'GET_MEMBERS_ERROR',
                authenticated: false
            };
        })
        .finally(function () {
            // always executed
        });
}