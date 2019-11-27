
import React, {Component} from 'react';
import {connect} from 'react-redux';

class Main extends Component{
    constructor(props){
        super(props);
    }

    render() {
        return(
            <div>
                <h1>Redux!!</h1>
            </div>
        );
    }
}

Main = connect()(Main);

export default Main;