defmodule MultiSampleWeb.PageController do
  use MultiSampleWeb, :controller

  alias MultiSample.Sample
  alias MultiSample.Sample.Member
  alias MultiSample.Sample.MemberScore

  def new(conn, _params) do
    prefectures = Sample.prefecture_list()

    render(conn, "new.html", [prefectures: prefectures])
  end

  def create(conn, params) do
    # Member
    member_id = params["member_id"]
    member_name = params["member_name"]
    member = %{member_name: member_name}

    # Goal
    goals = params["goal"]
    assists = params["assist"]
    scores = Enum.zip([goals, assists])

IO.inspect(scores)
    Sample.create_score(member, scores)

    render(conn, "new.html")
  end
end
