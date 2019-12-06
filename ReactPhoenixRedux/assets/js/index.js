import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from "react-redux";
import { ConnectedRouter } from 'connected-react-router';
import { Switch, Route } from 'react-router-dom';

import configureStore, { history } from './stores/configureStore'
import App from "./App";
import Page01 from "./components/Page01";
import Page02 from "./components/Page02";
import Page03 from "./components/Page03";
import Page04 from "./components/Page04";

const store = configureStore();

ReactDOM.render(
    <Provider store={store}>
        <ConnectedRouter history={history} >
            <Switch>
                <Route exact path="/" component={App}/>
                <Route exact path="/page1" component={Page01}/>
                <Route exact path="/page2" component={Page02}/>
                <Route exact path="/page3" component={Page03}/>
                <Route exact path="/page4" component={Page04}/>
            </Switch>
        </ConnectedRouter>
    </Provider>,
    document.getElementById('root')
);