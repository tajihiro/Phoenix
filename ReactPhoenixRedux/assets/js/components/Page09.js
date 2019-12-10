import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import axios  from 'axios';

class Page09 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            authenticated: true,
        }
        this.onLogout = this.onLogout.bind(this);
    }

    onLogout(e){
        e.preventDefault();
        this.props.dispatch({type: 'LOGOUT'});
        // this.setState({authenticated: false});
    }

    render() {
        return (
            <div>
                <div>ログイン成功</div>
                <div>{this.props.page08.member.last_name} {this.props.page08.member.first_name}</div>
                <div>{this.props.page08.member.email}</div>
                <div><input type="button" value='ログアウト' onClick={this.onLogout} /></div>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}

export default connect((state)=>state)(Page09);