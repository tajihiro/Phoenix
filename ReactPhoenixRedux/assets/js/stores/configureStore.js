import { createBrowserHistory } from 'history';
import { applyMiddleware, compose, createStore} from 'redux';
import { routerMiddleware } from 'connected-react-router';
// import thunk from 'redux-thunk';
import createSagaMiddleware from 'redux-saga';
// import rootSaga from "../sagas/saga";
import rootReducer from "../reducers";

const sagaMiddleware = createSagaMiddleware();
export const history = createBrowserHistory()

export default function configureStore() {
    const store = createStore(
        rootReducer(history), // Reducers
        compose(
            process.env.NODE_ENV === 'development' && window.devToolsExtension ? window.devToolsExtension() : f => f,
            applyMiddleware(
                routerMiddleware(history),
                // thunk,
                sagaMiddleware
            ) // Middle Wares
        )
    );
    // sagaMiddleware.run(rootSaga);
    return store;
}


