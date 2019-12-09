defmodule ReactPhoenixReduxWeb.MemberChannel do
  use Phoenix.Channel

  def join("member:lobby", _message, socket) do
    IO.puts ("----JOINED----")
    {:ok, socket}
  end

  def join("member:" <> _room_id, _socket) do
    IO.puts ("----ERROR----")
    {:error, %{reason: "authorized"}}
  end

  def handle_in("new_message", %{"body" => body}, socket) do
    IO.puts ("----HANDLE IN----")
    broadcast!(socket, "new_message", %{body: body})
    {:noreply, socket}
  end
end