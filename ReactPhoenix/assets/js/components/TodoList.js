import React, { Component } from 'react';
import TodoItem from './TodoItem';

class TodoList extends Component {
    render() {
        const list = this.props.tasks.map(todo => {
                return <TodoItem {...todo} key={todo.id} />
            }
        );
        return(
            <div>
                {list}
            </div>
        );
    }
}
export default TodoList;