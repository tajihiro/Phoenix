import React, {Component} from 'react';
import {connect} from 'react-redux';

import {addMemo, findMemo} from "./Store";

class FindForm extends Component{
    constructor(props){
        super(props);
        this.state = {
            find:''
        }
        this.doChange = this.doChange.bind(this);
        this.doSubmit = this.doSubmit.bind(this);
    }

    doChange(e){
        this.setState({
            find: e.target.value
        });
    }

    doSubmit(e){
        e.preventDefault();
        let action = findMemo(this.state.find);
        this.props.dispatch(action);
    }

    render(){
        return(
            <div>
                <form onSubmit={this.doSubmit}>
                    <input type="text" size="10" onChange={this.doChange} value={this.state.message}/>
                    <input type="submit" value="FIND"/>
                </form>
            </div>
        );
    }
}
export default connect((state)=> state)(FindForm)