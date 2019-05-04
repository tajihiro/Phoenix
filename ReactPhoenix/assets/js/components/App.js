import React, { Component } from 'react';
import {connect} from "react-redux";

function mappingState(state) {
    return state;
}

class App extends Component {
    constructor(props){
        super(props);
    }

    render() {
        return (
            <div>
                <div>
                    <Message />
                    <Button />
                </div>
            </div>
        );
    }
}
App = connect()(App);

class Message extends Component {
    style = {
        fontSize: "20pt",
        padding: "20px 10px"
    }
    render() {
        return(
            <p style={this.style}>
                {this.props.message} : {this.props.counter}
            </p>
        );
    }
}
Message = connect(mappingState)(Message);

class Button extends Component {
    style = {
        fontSize: "16pt",
        padding: "5px 10px"
    }
    constructor(props){
        super(props);
        this.doAction = this.doAction.bind(this);
    }

    doAction(e){
       if(e.shiftKey){
           this.props.dispatch({type: 'DECREMENT'});
       } else {
           this.props.dispatch({type: 'INCREMENT'});
       }
    }
    render() {
        return(
            <button style={this.style} onClick={this.doAction}>CLICK</button>
        );
    }
}
Button = connect()(Button);

export default App;