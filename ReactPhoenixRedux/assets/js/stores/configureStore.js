import { createBrowserHistory } from 'history';
import { applyMiddleware, compose, createStore} from 'redux';
import { routerMiddleware } from 'connected-react-router';
import thunk from 'redux-thunk';
import rootReducer from "../reducers";

export const history = createBrowserHistory()

export default function configureStore() {
    const store = createStore(
        rootReducer(history), // Reducers
        compose(
            applyMiddleware(
                routerMiddleware(history),
                thunk
            ) // Middle Wares
        )
    );
    return store;
}

