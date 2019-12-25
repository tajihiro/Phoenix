import { createBrowserHistory } from 'history';
import { applyMiddleware, compose, createStore} from 'redux';
import { routerMiddleware } from 'connected-react-router';
import createSagaMiddleware from 'redux-saga';
import rootReducer from "../reducers";

import { helloSaga } from "../sagas/saga";
const sagaMiddleware = createSagaMiddleware();
export const history = createBrowserHistory()

export default function configureStore() {
    const store = createStore(
        rootReducer(history), // Reducers
        compose(
            process.env.NODE_ENV === 'development' && window.devToolsExtension ? window.devToolsExtension() : f => f,
            applyMiddleware(
                routerMiddleware(history),
                sagaMiddleware
            ) // Middle Wares
        )
    );
    sagaMiddleware.run(helloSaga);
    return store;
}


