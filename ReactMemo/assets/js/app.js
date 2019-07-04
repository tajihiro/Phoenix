import React from 'react';
import ReactDOM from 'react-dom';
import {Provider} from 'react-redux';
import Main from './main';
import MemoStore from './memo/Store'

ReactDOM.render(
    <Provider store={MemoStore}>
        <Main />
    </Provider>,
    document.getElementById('root')
);


