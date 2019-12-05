export const getCommentsError = status => ({
    type: 'GET_COMMENTS_ERROR',
    hasError: status
})

export const loadComments = status => ({
    type: 'LOAD_COMMENTS',
    isLoading: status
})

export const fetchCommentsSuccess = comments => ({
    type: 'FETCH_COMMENTS_SUCCESS',
    comments: comments
})

export const fetchComments = url => {
    return (dispatch) => {
        dispatch(loadComments(true));

        fetch(url)
            .then((response) => {
                if(!response.ok) {
                    throw Error(response.statusText);
                }
                dispatch(loadComments(false));

                return response;
            })
            .then((response) => response.json())
            .then((comments) => dispatch(fetchCommentsSuccess(comments)))
            .catch(() => dispatch(getCommentsError(true)));
    }
}