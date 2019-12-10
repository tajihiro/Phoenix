import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { Socket } from 'phoenix';

const socket = new Socket("/socket", {params: {token: window.userToken}});
socket.connect();
const channel = socket.channel("member:lobby", {});
channel.on('new_message', state => {
    dataReceive(state);
    // this.setState({
    //     data: []
    // });
    // this.props.dispatch({type: 'BROAD_CASTED'})
});


class Page06 extends Component{
    constructor(props) {
        super(props);
        this.state = {
            data: [],
        }

        this.doEnterKey = this.doEnterKey.bind(this);
    }

    componentDidMount() {
        channel.join()
            .receive("ok", resp => { console.log("Joined successfully", resp) })
            .receive("error", resp => { console.log("Unable to join", resp) })
    }

    doEnterKey(e){
        if(e.keyCode === 13){
            console.log('Enter Key!!!' + e.target.value);
            channel.push("new_message", {body: e.target.value});
            e.target.value = '';
            this.props.dispatch({type: 'DO_ENTER'});
            // this.setState({
            //
            // });
        }
    }

    dataReceive(state){
        console.log("Broad Casted!!!" + state.body);


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
export default connect()(Page06);
