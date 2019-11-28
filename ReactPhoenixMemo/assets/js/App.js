import React, {Component} from 'react';
import {connect} from 'react-redux';
import Memo from './Memo';
import AddForm from './AddForm'

class App extends Component {
    constructor(props){
        super(props);
    }

    render() {
        return(
            <div>
                <h1>Memo</h1>
                <AddForm />
                <hr/>
                <table>
                    <tbody>
                    <tr>
                        <td>FindForm</td>
                        <td>DeleteForm</td>
                    </tr>
                    </tbody>
                </table>
                <Memo />
            </div>
        );
    }
}

export default App;