import { combineReducers, createStore } from 'redux';
import { connectRouter } from "connected-react-router";
import { appReducer } from "./AppReducer";
import { getCommentsError, loadComments, comments } from './CommentReducer';

const createRootReducer = (history) => combineReducers({
    router: connectRouter(history),
    appReducer,
    getCommentsError,
    loadComments,
    comments
});

export default createRootReducer;