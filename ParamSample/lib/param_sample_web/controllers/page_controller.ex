defmodule ParamSampleWeb.PageController do
  use ParamSampleWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, params) do
    member_id = params["member_id"]
    goals = params["goal"]
    assists = params["assist"]
    mvp_flgs = params["mvp_flg"]

    IO.inspect(member_id)

    redirect(conn, to: Routes.page_path(conn, :new))
  end
end
