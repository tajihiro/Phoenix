defmodule ReactPhoenixMemoWeb.MemoController do
  use ReactPhoenixMemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
