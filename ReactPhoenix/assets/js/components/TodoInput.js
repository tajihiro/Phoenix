import React, {Component} from 'react';

class TodoInput extends Component {
    constructor(props){
        super(props);
    }
    render() {
        return(
            <div>
                <div>
                    <input placeholder={this.props.name} />
                </div>
                <div>
                    <button>登録</button>
                </div>
            </div>
        );
    }
}
export default TodoInput;