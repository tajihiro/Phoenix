defmodule PhoenixSample.SampleController do
  use PhoenixSample.Web, :controller

 plug :show_log
 plug :find_message
 plug :set_params, "INITIATE!!" when action in [:show]

  def index(conn, _params) do
    IO.inspect "INDEX"
    conn
      |> put_layout("admin.html")
      |> assign(:outer_url, "http://www.yahoo.co.jp")
      |> render "index.html"
  end

  def show(conn, _params) do
    # パラメータ取得
    IO.inspect "SHOW"
    name = _params["name"]
    msg = "調子は良いかい?"
    conn 
      # |> put_layout(false)
      |> put_layout("admin.html")
      |> put_flash(:info, "Welcome to Phoenix!!")
      |> put_flash(:error, "Failed by Phoenix!!")
      # |> render "show.html", message: msg
      |> assign(:name, name)
      |> assign(:message, msg)
      |> render "show.html"
  end

  def show_json(conn, _params) do
    json conn, %{id: 1}
  end

  defp set_params(conn, params) do
    conn
      |> assign(:init, params)
  end

  defp find_message(id) do
    IO.inspect id
  end
  defp find_message(conn, _) do
    case find_message(conn.params["msg"]) do
      nil ->
        IO.inspect "NIL"
        conn
      message -> 
        IO.inspect "MSG"
       conn
    end
  end
  defp show_log(conn, _) do
    IO.inspect "LOG"
    conn
  end
end

