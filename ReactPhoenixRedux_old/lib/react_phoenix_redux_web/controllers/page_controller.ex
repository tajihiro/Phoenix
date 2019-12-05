defmodule ReactPhoenixReduxWeb.PageController do
  use ReactPhoenixReduxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
