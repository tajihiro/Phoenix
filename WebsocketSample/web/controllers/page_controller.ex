defmodule WebsocketSample.PageController do
  use WebsocketSample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
