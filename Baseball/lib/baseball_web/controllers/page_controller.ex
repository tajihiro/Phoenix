defmodule BaseballWeb.PageController do
  use BaseballWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
