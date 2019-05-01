// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import React, {Component} from 'react';
import ReactDOM from 'react-dom';
import TodoInput from './components/TodoInput';
import TodoList from './components/TodoList';

class App extends Component {
    constructor(props){
        super(props);
        this.state = {
            tasks: [
                {title: 'Todo01', id: 0},
                {title: 'Todo02', id: 1},
                {title: 'Todo03', id: 2},
                {title: 'Todo04', id: 3}
            ]
        }
    }

    render() {
        return(
            <div>
              こんにちは。React App Component!!!
              <TodoInput name="初期パラメータ"/>
              <TodoList tasks={this.state.tasks} />
            </div>
        );
    }
}
ReactDOM.render(<App />, document.getElementById('root'));
