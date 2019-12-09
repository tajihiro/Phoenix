import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

class Page06 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            data: [],
        }
    }

    render() {
        return (
            <div>
                <div>登録完了</div>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}

export default connect()(Page06);