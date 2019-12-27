import '@babel/polyfill';
import { fork, take, put, call } from 'redux-saga/effects';
import {getTeamList} from "../actions/connect";
import axios from "axios";

export function* helloSaga(){
    console.log('Hello Saga Root !!');
    yield fork(saga01);
    yield fork(saga02);
    yield fork(sagaFetch01);
    yield fork(sagaFetch02);
}

function* saga01() {
    console.log('Hello Saga01 !!!');
}

function* saga02() {
    console.log('Hello Saga02 !!!');
}

function* sagaFetch01() {
    while (true) {
        try{
            yield take('FETCH_TEAMS');
            const response = yield call(axios.get, '/api/teams');
            let teams = response.data.data;
            console.log(teams);
            yield put(getTeamAction(teams));
        }catch(error) {
            // handle error
            console.log(error);
        }
    }
}
function* sagaFetch02() {
    while (true) {
        try{
            yield take('FETCH_MEMBERS');
            const response = yield call(axios.get, '/api/members');
            let members = response.data.data;
            console.log(members);
            yield put(getMemberAction(members));
        }catch(error) {
            // handle error
            console.log(error);
        }
    }
}

function getTeamAction(teams){
    return {
        type: 'FETCH_MEMBERS',
        member_id: 0,
        members: teams
    }
}

function getMemberAction(members){
    return {
        type: 'GET_MEMBERS',
        member_id: 22,
        members: members
    }
}
