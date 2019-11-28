import React, {Component} from 'react';
import {connect} from 'react-redux';

function mappingState(state) {
    return state;
}

class App extends Component{
    constructor(props){
        super(props);
    }

    render() {
        return(
            <div>
                <h1>Redux!!</h1>
                <Message />
                <Button />
            </div>
        );
    }
}
App = connect()(App);

class Message extends Component{
    render() {
        return(
            <p>{this.props.message} : {this.props.counter}</p>
        );
    }
}
Message = connect(mappingState)(Message);

class Button extends Component{
    constructor(props){
        super(props);
        this.doClick = this.doClick.bind(this);
    }
    doClick(e){
        this.props.dispatch({type: 'CLICK'});
    }
    render() {
        return(
            <button onClick={this.doClick}>CLICK</button>
        );
    }
}
Button = connect()(Button);

export default App;