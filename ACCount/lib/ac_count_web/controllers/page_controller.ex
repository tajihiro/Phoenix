defmodule AcCountWeb.PageController do
  use AcCountWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
