import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import {getServerList} from '../actions/connect';

class Page10 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            member_id: 0,
            members: []
        }
    }

    componentDidMount() {
        getServerList();
    }

    render() {
        return (
            <div>
                <div>Page 10</div>
                <div>MEMBER ID: {this.props.page10.member_id}</div>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}

export default connect((state) => state)(Page10);