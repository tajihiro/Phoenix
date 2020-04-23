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

  '''
    都道府県リスト取得処理
  '''
  def prefecture_list() do
    Repo.all(Prefecture)
  end


  '''
    メンバー登録処理
  '''
  def create_member(member) do
      Multi.new()
        |> Multi.insert(:member, Member.changeset(%Member{}, member))
        |> Repo.transaction()
  end

  def getNewMemberId() do
    from m in Member, select: max(m.id)
  end

  '''
    メンバースコア登録処理
  '''
  def create_member_score(member_scores_chnagesets) do
    Multi.new()
    |> Multi.insert_all(:insert_all, MemberScore ,member_scores_chnagesets)
    |> Repo.transaction()

  end

end