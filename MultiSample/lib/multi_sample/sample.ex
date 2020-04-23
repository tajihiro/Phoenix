defmodule MultiSample.Sample do
  @moduledoc """
  The Sample context.
  """

  import Ecto.Query, warn: false
  alias MultiSample.Repo
  alias Ecto.Multi

  alias MultiSample.Sample.Prefecture
  alias MultiSample.Sample.Member
  alias MultiSample.Sample.MemberScore

  def prefecture_list() do
    Repo.all(Prefecture)
  end


  def create_score(member, scores) do
    Multi.new()
      |> Multi.insert(:member, Member.changeset(%Member{}, member))
#      insert_all
#      |> Multi.insert(:member_scores,
#           fn(%Member{id: member_id}) -> MemberScore.changeset(%MemberScore{member_id: member_id}, scores) end )
      |> Repo.transaction()
  end


end