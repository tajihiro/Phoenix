import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from "react-router-dom";

class Page01 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            comments: [],
            isLoading: false,
            hasError: false
        }
        console.log('Constructor : ' + this.state);
    }

    componentDidMount() {
       this.fetchData('https://594ecc215fbb1a00117871a4.mockapi.io/comments');
    }

    // fetchData = url => {
    fetchData(url){
        this.setState({isLoading: true});
        fetch(url).then((response) => {
            if(!response.ok){
                throw Error(response.statusText);
            }
            this.setState({isLoading: false});
            return response;
        })
            .then((response) => response.json())
            .then((comments) => this.setState({ comments }))
            .catch(() => this.setState({ hasError: true }));
    }

    render() {
        console.log('Render : ' + this.state)
        if (this.state.hasError) {
            return <p>error</p>;
        }
        if (this.state.isLoading) {
            return <p>loading . . . </p>;
        }
        return (
            <div>
            <ul>
                {this.state.comments.map((item) => (
                    <li key={item.id}>
                        {item.comment}
                    </li>
                ))}
            </ul>
            <Link to={"/"}>戻る</Link>
            </div>
        )
    }
}

export default connect((state) => state)(Page01);