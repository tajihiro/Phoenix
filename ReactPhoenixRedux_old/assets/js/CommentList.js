import React, {Component} from 'react';
import {connect} from 'react-redux';
import {Link} from "react-router-dom";

class CommentList extends Component {
    constructor(props) {
        super(props);

        this.state = {
            comments: [
                {
                    id: 1,
                    comment: 'comment1'
                },
                {
                    id: 2,
                    comment: 'comment2'
                },
                {
                    id: 3,
                    comment: 'comment3'
                },
                {
                    id: 4,
                    comment: 'comment4'
                },
                {
                    id: 5,
                    comment: 'comment5'
                }
            ],
            hasError: false,
            isLoading: false
        }
    }
    fetchData(url) {
        this.setState({ isLoading: true });
        fetch(url)
            .then((response) => {
                if (!response.ok) {
                    throw Error(response.statusText);
                }
                this.setState({ isLoading: false });
                return response;
            })
            .then((response) => response.json())
            .then((comments) => this.setState({ comments }))
            .catch(() => this.setState({ hasErrored: true }));
    }
    componentDidMount() {
        this.fetchData('https://594ecc215fbb1a00117871a4.mockapi.io/comments');
    }

    render() {
        if(this.state.hasError){
            return(<p>Error!!</p>);
        }
        if(this.state.isLoading){
            return(<div>Loading . . .</div>);
        }
        return(
            <div>
                <h3>Comment List</h3>
                <ul>
                    {this.state.comments.map((item) => (
                    <li>
                        {item.comment}
                    </li>
                    ))}
                </ul>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}
export default connect()(CommentList);