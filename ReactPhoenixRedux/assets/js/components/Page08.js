import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import axios  from 'axios';
import LoginForm from "./loginForm";
import InputForm from "./inputForm";

class Page08 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            authenticated: false
        }
    }

    render() {
        console.log('this.props.page08:' + this.props.page08.authenticated );
        if(this.props.page08.authenticated){
            return (<div>ログイン成功</div>);
        }else{
            return (<LoginForm/>);
        }
    }
}

export default connect((state)=>state)(Page08);