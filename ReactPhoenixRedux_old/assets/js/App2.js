import React, {Component} from 'react';
import {connect} from 'react-redux';
import {Link} from "react-router-dom";

import { push } from 'connected-react-router'

class App2 extends Component {
    constructor(props){
        super(props);
    }

    render() {
        return(
            <div>
                <div>Page2</div>
                <Link to={"/"}>戻る</Link>
                <div><input type="button" value="戻る" onClick={()=> {this.props.push("/Page3")}}/></div>
            </div>

        );
    }
}
export default connect((state)=>state, {push})(App2);