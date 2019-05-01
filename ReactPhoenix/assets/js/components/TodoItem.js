import React from 'react';

function TodoItem(props) {
    return(
        <li>
            {props.title} / {props.id}
        </li>
    );
}
export default TodoItem;