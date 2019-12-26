import { Socket } from 'phoenix';

const initData = {
    data: []
}

export function page07Reducer(state = initData, action){
    switch (action.type) {
        case 'INIT_SOCKET':
            return initSocket(state, action);
        case 'DO_ENTER':
            return state;
        default:
            return state;
    }
}

function initSocket(state, action){
    const socket = new Socket("/socket", {params: {token: window.userToken}});
    socket.connect();
    const channel = socket.channel("member:lobby", {});
    channel.join()
        .receive("ok", resp => { console.log("Joined successfully", resp) })
        .receive("error", resp => { console.log("Unable to join", resp) })
    return {
        socket: socket,
        channel: channel
    }
}
