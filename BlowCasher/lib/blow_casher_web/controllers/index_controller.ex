defmodule BlowCasherWeb.IndexController do
  use BlowCasherWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", group: nil
  end
end
