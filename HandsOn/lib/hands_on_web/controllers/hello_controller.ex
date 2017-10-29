defmodule HandsOnWeb.HelloController do
  use HandsOnWeb, :controller

  def index(conn, _params) do
    name = _params["name"]
    IO.inspect name
    # render conn, "index.html", %{name: "たぢ"}
    render conn, "index.html", %{name: name}
  end
end
