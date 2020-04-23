defmodule MultiSampleWeb.PageController do
  use MultiSampleWeb, :controller

  def new(conn, _params) do

    mvp_flg = ["Blue": "blue", "Red": "red", "Yellow": "yellow", "Green": "green"]

    render(conn, "new.html", [mvp_flg: mvp_flg])
  end

  def create(conn, _params) do
    render(conn, "new.html")
  end

end
