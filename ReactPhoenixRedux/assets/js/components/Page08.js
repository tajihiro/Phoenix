import React, { Component } from 'react';
import { connect } from 'react-redux';
import LoginForm from "./loginForm";
import Page09 from "./Page09";

class Page08 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            authenticated: false,
            members: ''
        }
    }

    render() {
        console.log('this.props.page08:' + this.props.page08.authenticated );
        if(this.props.page08.authenticated){
            return (<Page09 />);
        }else{
            return (<LoginForm/>);
        }
    }
}

export default connect((state)=>state)(Page08);