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
                    <li><Link to={{pathname: '/page1'}}>Page 1</Link></li>
                    <li><Link to={{pathname: '/page2'}}>Page 2</Link></li>
                    <li><Link to={{pathname: '/page3'}}>Page 3</Link></li>
                    <li><Link to={{pathname: '/page4'}}>Page 4</Link></li>
                </ul>
            </div>
        );
    }
}

export default connect((status)=>status)(App);