defmodule ReactMemoWeb.PageController do
  use ReactMemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
