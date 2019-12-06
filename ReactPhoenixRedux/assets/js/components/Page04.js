import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from "react-router-dom";

class Page04 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            mode: 'input'
        }
        this.doConfirm = this.doConfirm.bind(this);
        this.doSubmit = this.doSubmit.bind(this);
    }

    doConfirm(e){
        e.preventDefault();
        this.props.dispatch({type: 'CONFIRM'});
        this.setState({mode: 'confirm'});
    }
    doSubmit(e){
        e.preventDefault();
        this.props.dispatch({type: 'INPUT'});
        this.setState({mode: 'input'});
    }
    render() {
        console.log("RENDER Page04 : " + this.state.mode);
        switch (this.state.mode) {
            case 'input':
                return(
                    <div>
                    <form onSubmit={this.doConfirm}>
                        <label>Last Name:</label>
                        <input type="text" name="last_name"/>
                        <label>First Name:</label>
                        <input type="text" name="first_name"/>
                        <label>Email:</label>
                        <input type="text" name="email"/>
                        <label>Password:</label>
                        <input type="text" name="passwd"/>
                        <input type="submit" value="確認"/>
                    </form>
                    <Link to={"/"}>戻る</Link>
                    </div>);
            case 'confirm':
                return(
                    <div>
                    <form onSubmit={this.doSubmit}>
                        <label>Last Name:</label>
                        <input type="hidden" name="last_name"/>
                        <label>First Name:</label>
                        <input type="hidden" name="first_name"/>
                        <label>Email:</label>
                        <input type="hidden" name="email"/>
                        <label>Password:</label>
                        <input type="hidden" name="passwd"/>
                        <input type="submit" value="更新"/>
                    </form>
                    <Link to={"/"}>戻る</Link>
                    </div>);
        }
    }
}

export default connect((state) => state)(Page04);