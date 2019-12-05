import React, {Component} from 'react';
import {connect} from 'react-redux';
import {Link} from "react-router-dom";

class App3 extends Component {
    constructor(props){
        super(props);
    }

    render() {
        return(
            <div>
                <div>Page3</div>
                <Link to={"/"}>戻る</Link>
            </div>

        );
    }
}
export default connect((state)=>state)(App3);