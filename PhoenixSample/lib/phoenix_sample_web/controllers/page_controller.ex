defmodule PhoenixSampleWeb.PageController do
  use PhoenixSampleWeb, :controller

  plug :call_func1 when action in [:index]
  plug :call_func2 when action in [:index, :main]
  plug :call_func3 when not action in [:index]
  
  def index(conn, _params) do
    IO.puts(action_name(conn))
    render conn, "index.html"
  end

  def main(conn, _params) do
    IO.puts(action_name(conn))
    render conn, "main.html"
  end
  
  defp call_func1(conn, _) do
    IO.puts "func1"
    conn
  end
  defp call_func2(conn, _) do
    IO.puts "func2"
    conn
  end
  defp call_func3(conn, _) do
    IO.puts "func3"
    conn
  end
end
