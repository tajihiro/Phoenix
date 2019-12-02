import React from 'react';
import ReactDom from 'react-dom';
import { Provider } from "react-redux";

import { Route, Switch } from 'react-router'
import { ConnectedRouter } from 'connected-react-router'

import App from "./App";
import App2 from "./App2";
import App3 from "./App3";
import configureStore, { history } from './configureStore'

const store = configureStore(/* provide initial state if any */)


ReactDom.render(
    <Provider store={store}>
        <ConnectedRouter history={history} >
            <Switch>
                <Route exact path="/" component={App}/>
                <Route exact path="/page2" component={App2}/>
                <Route exact path="/page3" component={App3}/>
            </Switch>
        </ConnectedRouter>
    </Provider>,
    document.getElementById('root')
);
