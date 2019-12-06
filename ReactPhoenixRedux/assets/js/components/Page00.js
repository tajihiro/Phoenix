import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import axios  from 'axios';

class Page00 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            data: [],
        }
    }

    render() {
        return (
            <div>
                <div>Page 0</div>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}

export default connect()(Page00);