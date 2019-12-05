export const getCommentsError = (state = false, action) => {
    switch (action.type) {
        case 'GET_COMMENTS_ERROR':
            return action.hasError;
        default:
            return state;
    }
}

export const loadComments = (state = false, action) => {
    switch (action.type) {
        case 'LOAD_COMMENTS':
            return action.isLoading;
        default:
            return state;
    }
}

export const comments = (state = [], action) => {
    switch (action.type) {
        case 'FETCH_COMMENTS_SUCCESS':
            return action.comments;
        default:
            return state;
    }
}