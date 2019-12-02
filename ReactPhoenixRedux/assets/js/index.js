import React from 'react';
import ReactDom from 'react-dom';
import App from "./App";
import {Provider} from "react-redux";

import appReducer from "./AppReducer";


ReactDom.render(
    <Provider store={appReducer}>
        <App />
    </Provider>,
    document.getElementById('root')
);
