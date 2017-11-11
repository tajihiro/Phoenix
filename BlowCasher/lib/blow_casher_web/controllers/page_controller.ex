defmodule BlowCasherWeb.PageController do
  use BlowCasherWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
