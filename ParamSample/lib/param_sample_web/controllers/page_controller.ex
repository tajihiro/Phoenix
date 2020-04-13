defmodule ParamSampleWeb.PageController do
  use ParamSampleWeb, :controller

  alias ParamSample.Sample

  def new(conn, _params) do
    render(conn, "new.html")
  end

#  def create(conn, %{"game" => game_params}) do
 def create(conn, params) do
    member_id = params["member_id"]
    goals = params["goal"]
    assists = params["assist"]
    mvp_flgs = params["mvp_flg"]

    Sample.create_game(params)
    conn
      |> put_flash(:info, "Game created Successfully.")
      |> redirect(to: Routes.page_path(conn, :new))
  end
end
