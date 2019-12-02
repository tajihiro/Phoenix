import React from 'react';
import ReactDom from 'react-dom';
import App from "./App";
import App2 from "./App2";
import {Provider} from "react-redux";
import {BrowserRouter as Router, Route} from 'react-router-dom';

import appReducer from "./AppReducer";

ReactDom.render(
    <Provider store={appReducer}>
        <Router>
            <Route exact path="/" component={App}/>
            <Route exact path="/page2" component={App2}/>
        </Router>
    </Provider>,
    document.getElementById('root')
);
