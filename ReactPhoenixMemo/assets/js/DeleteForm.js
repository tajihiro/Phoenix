import React, {Component} from 'react';
import {connect} from 'react-redux';

import {deleteMemo} from "./Store";


class DeleteForm extends Component {
    constructor(props) {
        super(props);
        this.state = {
            number: 0
        }
        this.doChange = this.doChange.bind(this);
        this.doSubmit = this.doSubmit.bind(this);
    }

    doChange(e) {
        this.setState({
            number: e.target.value
        });
    }

    doSubmit(e) {
        e.preventDefault();
        let action = deleteMemo(this.state.number);
        this.props.dispatch(action);
        this.setState({
            number: 0
        });
    }

    render() {
        let n = 0;
        let items = this.props.data.map((value) => (
            <option key={n} value={n++}> {value.message.substring(0, 10)} </option>
        ));
        return(
            <div>
                <form onSubmit={this.doSubmit}>
                    <select onChange={this.doChange} defaultValue={"-1"}>
                        {items}
                    </select>
                    <input type="submit" value="DEL"/>
                </form>
            </div>
        );
    }
}
export default connect((state) => state)(DeleteForm);