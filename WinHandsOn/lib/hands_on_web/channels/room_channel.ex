defmodule HandsOnWeb.RoomChannel do
    use HandsOnWeb, :channel

    def join("room:lobby", payload, socket) do
        IO.puts "JOIN!!"
        Process.flag(:trap_exit, true)
        {:ok, socket}
    end

    def handle_in("new_msg", payload, socket) do
        IO.puts "HANDLE_IN:new message!!"
        broadcast! socket, "new_msg", payload
        {:reply, {:ok, payload}, socket}
    end

    def handle_in("ping", payload, socket) do
        IO.puts "HANDLE_IN:ping!!"
        {:reply, {:ok, payload}, socket}
    end

end