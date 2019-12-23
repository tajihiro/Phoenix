import React, {Component} from 'react';
import {connect} from 'react-redux';
import { Link } from 'react-router-dom';

class App extends Component{
    constructor(props) {
        super(props);
    }

    render() {
        return(
            <div>
                <h3>App</h3>
                <ul>
                    <li><Link to={{pathname: '/page0'}}>Page 0 (Redux テンプレート)</Link></li>
                    <li><Link to={{pathname: '/page1'}}>Page 1 (Load Data by fetch)</Link></li>
                    <li><Link to={{pathname: '/page2'}}>Page 2 (Load Data by axios)</Link></li>
                    <li><Link to={{pathname: '/page3'}}>Page 3 (Load Database data)</Link></li>
                    <li><Link to={{pathname: '/page4'}}>Page 4 (Page move Input Form)</Link></li>
                    <li><Link to={{pathname: '/page5'}}>Page 5 (Input Form Post Data)</Link></li>
                    <li><Link to={{pathname: '/page6'}}>Page 6 (Websocket)</Link></li>
                    <li><Link to={{pathname: '/page7'}}>Page 7 (Websocket Refactored)</Link></li>
                    <li><Link to={{pathname: '/page8'}}>Page 8 (Login)</Link></li>
                    <li><Link to={{pathname: '/page10'}}>Page 10 (Redux Sage)</Link></li>
                </ul>
            </div>
        );
    }
}

export default connect((status)=>status)(App);