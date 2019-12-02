import React, {Component} from 'react';
import {connect} from 'react-redux';
import {changeMessage} from "./AppReducer";

import {Link} from 'react-router-dom';

class App extends Component{
    constructor(props){
        super(props);
        this.state = {
            message: 'こんにちは。'
        }
        this.doChange = this.doChange.bind(this);
        this.doClick = this.doClick.bind(this);
    }
    doChange(e){
        const message = e.target.value;
        this.setState(
            {message: message}
        );
    }

    doClick(e){
        // e.preventDefault();
        this.setState(
            {message: 'こんばんは。'}
        );
        // let action = changeMessage('こんばんは。');
        // this.props.dispatch(action);
    }

    render() {
        return(
            <div>
                <div>{this.state.message}</div>
                <input type="text" value={this.state.message} onChange={this.doChange}/>
                <input type="button" onClick={this.doClick} value="OK"/>
                <div>
                    <Link to={{pathname: '/page2'}}>Page 2</Link>
                </div>
                <div>
                    <Link to={{pathname: '/page3'}}>Page 3</Link>
                </div>
            </div>
        );
    }
}

export default connect((state)=>state)(App);