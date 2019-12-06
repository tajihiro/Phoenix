import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import axios  from 'axios';

class Page02 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            comments: [],
            isLoading: false,
            hasError: false
        }
    }

    componentDidMount() {
        this.fetchData('https://594ecc215fbb1a00117871a4.mockapi.io/comments');
    }

    fetchData(url){
        let self = this;
        self.setState({isLoading: true});
        axios.get(url)
            .then(function (response) {
            // handle success
            console.log(response.data);
                self.setState({
                    comments: response.data,
                    isLoading: false}
                    );
            })
            .catch(function (error) {
                // handle error
                console.log(error);
                self.setState({hasError: true });
            })
            .finally(function () {
                // always executed
            });
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
        );
    }
}

export default connect()(Page02);