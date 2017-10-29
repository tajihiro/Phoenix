defmodule WebsocketSample.RoomChannel do
  use WebsocketSample.Web, :channel

  def join("room:lobby", payload, socket) do
    IO.puts("JOIN!!")
    IO.inspect(payload)
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    IO.puts("HANDLE_IN:ping!!")
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    IO.puts("HANDLE_IN:shout!!")
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    IO.puts("HANDLE_IN:" <> body)

    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end

  # intercept ["new_msg"]

  def handle_out("new_msg", msg, socket) do
    IO.puts("HANDLE_OUT:new_msg!!")
    # if User.ignoring?(socket.assigns[:user], msg.user_id) do
    #   {:noreply, socket}
    # else
    #   push socket, "new_msg", msg
      {:noreply, socket}
    # end
  end
  # def handle_out("new_msg", payload, socket) do
  #   IO.puts("HANDLE_OUT:new_msg!!")
  #   push socket, "new_msg", payload
  #   {:noreply, socket}
  # end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
