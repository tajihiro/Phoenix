import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

// channel.on('new_message', state => {
//     console.log("Broad Casted!!!" + state.body);
// });

class Page07 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            data: [],
        }
        this.doEnterKey = this.doEnterKey.bind(this);
        props.dispatch({type: 'INIT_SOCKET' });
    }

    doEnterKey(e){
        console.log(this.props.page07.channel);
        if(e.keyCode === 13){
            console.log('Enter Key!!!' + e.target.value);
            // channel.push("new_message", {body: e.target.value});
            // e.target.value = '';
            // this.props.dispatch({type: 'DO_ENTER'});
        }
    }

    render() {
        return (
            <div>
                <div>Websocket</div>
                <div id="messages"></div>
                <input id="chat-input" type="text" onKeyDown={this.doEnterKey}></input>
                <Link to={"/"}>戻る</Link>
            </div>
        );
    }
}
export default connect()(Page07);
