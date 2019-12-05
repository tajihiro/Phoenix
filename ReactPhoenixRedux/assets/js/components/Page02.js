import React, {Component} from 'react';
import {connect} from 'react-redux';
import { Link } from 'react-router-dom';

class Page02 extends Component{
    constructor(props) {
        super(props);
    }

    render() {
        return(
            <div>
                <h3>Page 2</h3>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}

export default connect()(Page02);