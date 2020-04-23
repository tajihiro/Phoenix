defmodule MultiSampleWeb.PageController do
  use MultiSampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
