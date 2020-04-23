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

  def create(member) do
    Multi.new()
    |> Multi.insert(:member, Member.changeset(%Member{}, member))
    |> Repo.transaction()
  end


end