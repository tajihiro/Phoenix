import React, { Component } from "react";
import { connect } from "react-redux";
import InputForm from "./inputForm";
import ConfirmForm  from "./comfirmForm";
import Page06 from "./Page06";
import Page03 from "./Page03";

class Page05 extends Component {
    constructor(props){
        super(props);
        this.state = {
            disp: 'input',
            members: ''
        }
    }

    render() {
        console.log('Page05#this.props.disp: ' + this.props.page04.disp);
        switch (this.props.page04.disp) {
            case 'input':
                return (<InputForm />);
            case 'confirm':
                return (<ConfirmForm />);
            case 'compleate':
                return (<Page03 />);
            default:
                return (<InputForm />);
        }
    }
}
export default connect((state)=>state)(Page05);
