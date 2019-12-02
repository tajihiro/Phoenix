import React from 'react';
import ReactDom from 'react-dom';
import { Provider } from "react-redux";

import { Route, Switch } from 'react-router'
import { ConnectedRouter, connectRouter } from 'connected-react-router'

import configureStore, { history } from './configureStore'
const store = configureStore(/* provide initial state if any */)

import App from "./App";
import App2 from "./App2";



ReactDom.render(
    <Provider store={store}>
        <ConnectedRouter history={history} >
            <Switch>
            <Route exact path="/" component={App}/>
            <Route exact path="/page2" component={App2}/>
            </Switch>
        </ConnectedRouter>
    </Provider>,
    document.getElementById('root')
);
