import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import axios from 'axios';

class Page03 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            members:[],
            isLoading: false,
            hasError: false
        }
    }

    componentDidMount() {
        this.fetchData('/members');
    }

    fetchData(url){
        let self = this;
        // self.setState({isLoading: true});
        axios.get(url)
            .then(function (response) {
            // handle success
            console.log(response.data);
            let data = response.data;
                self.setState({
                    members: data.data,
                    isLoading: false}
                    );
            })
            .catch(function (error) {
                // handle error
                console.log(error);
                // self.setState({hasError: true });
            })
            .finally(function () {
                // always executed
            });
    }

    render() {
        if (this.state.hasError) {
            return <p>error</p>;
        }
        if (this.state.isLoading) {
            return <p>loading . . . </p>;
        }
        return (
            <div>
                <table>
                    <thead>
                    <tr>
                        <th>Last Name</th>
                        <th>First Name</th>
                        <th>Email</th>
                    </tr>
                    </thead>
                    <tbody>
                    {this.state.members.map((member) => (
                    <tr key={member.id}>
                        <td>{member.last_name}</td>
                        <td>{member.first_name}</td>
                        <td>{member.email}</td>
                    </tr>
                    ))}
                    </tbody>
                </table>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}

export default connect()(Page03);