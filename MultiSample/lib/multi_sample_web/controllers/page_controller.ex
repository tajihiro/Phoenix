defmodule MultiSampleWeb.PageController do
  use MultiSampleWeb, :controller

  alias MultiSample.Sample
  alias MultiSample.Sample.Member
  alias MultiSample.Sample.MemberScore

  '''
    登録画面表示処理
  '''
  def new(conn, _params) do
    prefectures = Sample.prefecture_list()

    render(conn, "new.html", [prefectures: prefectures])
  end


  '''
    登録処理
  '''
  def create(conn, params) do
    # Member
    member_id = params["member_id"]
    member_name = params["member_name"]
    member = %{member_name: member_name}
    Sample.create_member(member)
    member_id = Sample.getNewMemberId()

IO.inspect(member)

    # Goal
    goals = params["goal"]
    assists = params["assist"]
    member_scores_changesets =
      Enum.zip([goals, assists])
        |> Enum.map(fn({g, a}) -> %{member_id: member_id, goal: String.to_integer(g), assist: String.to_integer(a), mvp_flg: 0} end)
#        |> Enum.map(fn(score_map)-> MemberScore.changeset(%MemberScore{}, score_map) end)

IO.inspect(member_scores_changesets)

    Sample.create_member_score(member_scores_changesets)

    render(conn, "new.html")
  end
end
