defmodule DbConnectWeb.PageController do
  use DbConnectWeb, :controller

  def index(conn, _params) do
    recodes = DB.query("select * from members")
    cols = recodes.columns
    rows = recodes.rows

    result = Enum.map(rows, &(Enum.zip(cols, &1)) |> Enum.into(%{}))
    IO.puts "DEBUG"

    render conn, "index.html", result: result
  end
end