import React, {Component} from 'react';
import {connect} from 'react-redux';

import {addMemo} from "./Store";

class AddForm extends Component{
    constructor(props){
        super(props);
        this.state = {
            message: ''
        }
        this.doChange = this.doChange.bind(this);
        this.doSubmit = this.doSubmit.bind(this);
    }

    render() {
        return(
            <div>
                <p>{this.props.message}</p>
                <form onSubmit={this.doSubmit}>
                    <input type="text" size="40" onChange={this.doChange}/>
                    <input type="submit" value="ADD"/>
                </form>
            </div>
        );
    }

    doChange(e){
        this.setState({
            message: e.target.value
        })
    }
    doSubmit(e){
        e.preventDefault();
        let action = addMemo(this.state.message);
        this.props.dispatch(action);
        this.setState({
            message: ''
        });
    }

}
export default connect()(AddForm);