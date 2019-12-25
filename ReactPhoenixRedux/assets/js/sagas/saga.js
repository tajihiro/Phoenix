import '@babel/polyfill';
import { fork, take } from 'redux-saga/effects';

export function* helloSaga(){
    console.log('Hello Saga Root !!');
    yield fork(saga01);
    yield fork(saga02);
    yield fork(sagaFetch);
}

function* saga01() {
    console.log('Hello Saga01 !!!');
}

function* saga02() {
    console.log('Hello Saga02 !!!');
}

function* sagaFetch() {
    while (true){
        console.log("Loop Start!!");
        yield take('FETCH_SAGA_START');
        console.log("Now Called saga03!!");
    }
}

