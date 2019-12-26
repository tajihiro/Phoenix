import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import axios  from 'axios';

class Page11 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            data: []
        }
        this.doCall = this.doCall.bind(this);
    }

    doCall(e){
        e.preventDefault();
        console.log("DO CALL!!");
        this.props.dispatch({type: 'FETCH_SAGA_START'});
    }

    render() {
        return (
            <div>
                <div>Page 11</div>
                <button onClick={this.doCall}>Call Saga 03</ button>
                <div>
                <Link to={"/"}>戻る</Link>
                </div>
            </div>
        );
    }
}

export default connect((state)=>state)(Page11);