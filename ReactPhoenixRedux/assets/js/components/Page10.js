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
        getServerList(this.props);
    }

    render() {
        return (
            <div>
                <div>Page 10</div>
                MEMBER ID: {this.props.page10.member_id}
                {this.props.page10.members.map((member) => (
                    <tr key={member.id}>
                        <td>{member.id}</td>
                        <td>{member.last_name}</td>
                        <td>{member.first_name}</td>
                        <td>{member.email}</td>
                    </tr>
                 )) }
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}
export default connect((state)=>state)(Page10);