import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import {getMemberList, getTeamList} from '../actions/connect';

class Page10 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            team_id: 0,
            teams: [],
            member_id: 0,
            members: []
        }
    }

    componentDidMount() {
        getTeamList(this.props);
        getMemberList(this.props);
    }

    render() {
        return (
            <div>
                <div>Page 10</div>
                <h3>Teams:</h3>
                <table>
                    <tbody>
                    {this.props.page10.teams.map((team) =>(
                        <tr key={team.id}>
                            <td>{team.id}</td>
                            <td>{team.team_name}</td>
                        </tr>
                    ))}
                    </tbody>
                </table>
                <h3>MEMBER ID: {this.props.page10.member_id}</h3>
                <table>
                    <tbody>
                    {this.props.page10.members.map((member) => (
                        <tr key={member.id}>
                            <td>{member.id}</td>
                            <td>{member.last_name}</td>
                            <td>{member.first_name}</td>
                            <td>{member.email}</td>
                        </tr>
                     )) }
                    </tbody>
                </table>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}
export default connect((state)=>state)(Page10);