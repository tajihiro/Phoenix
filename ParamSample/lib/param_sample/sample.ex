defmodule ParamSample.Sample do
  @moduledoc """
  The Sample context.
  """

  import Ecto.Query, warn: false
  alias ParamSample.Repo
  alias Ecto.Multi

  alias ParamSample.Sample.Member
  alias ParamSample.Sample.Game
  alias ParamSample.Sample.Group

  @doc """
  Returns the list of members.

  ## Examples

      iex> list_members()
      [%Member{}, ...]

  """
  def list_members do
    Repo.all(Member)
  end

  @doc """
  Gets a single member.

  Raises `Ecto.NoResultsError` if the Member does not exist.

  ## Examples

      iex> get_member!(123)
      %Member{}

      iex> get_member!(456)
      ** (Ecto.NoResultsError)

  """
  def get_member!(id), do: Repo.get!(Member, id)

  @doc """
  Creates a member.

  ## Examples

      iex> create_member(%{field: value})
      {:ok, %Member{}}

      iex> create_member(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_member(attrs \\ %{}) do
    %Member{}
    |> Member.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a member.

  ## Examples

      iex> update_member(member, %{field: new_value})
      {:ok, %Member{}}

      iex> update_member(member, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_member(%Member{} = member, attrs) do
    member
    |> Member.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a member.

  ## Examples

      iex> delete_member(member)
      {:ok, %Member{}}

      iex> delete_member(member)
      {:error, %Ecto.Changeset{}}

  """
  def delete_member(%Member{} = member) do
    Repo.delete(member)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking member changes.

  ## Examples

      iex> change_member(member)
      %Ecto.Changeset{source: %Member{}}

  """
  def change_member(%Member{} = member) do
    Member.changeset(member, %{})
  end


  def create_game(attrs \\ %{}) do

    group = %Group{group_name: "Blowfish"}

    Multi.new()
    |> Multi.insert(:insert, group)
    |> Repo.transaction()
    query = from g in Group, select: max(g.id)
    group_id = Repo.one(query)

    mvp_member_id = hd(attrs["mvp_flg"])
    points =
      Enum.zip([attrs["member_id"], attrs["goal"], attrs["assist"]])
        |> Enum.map(fn({m, g, a}) -> {m, empty_to_zero(g), empty_to_zero(a)} end)
        |> Enum.map(fn({m, g, a}) -> %{member_id: m, goal: g, assist: a, group_id: group_id, mvp_flg: 0} end)
        |> Enum.filter(fn(map) -> empty_member(map) end)
        |> Enum.map(fn(target) -> put_mvp_flg(mvp_member_id, target) end)
#        |> Enum.filter(fn(%{m, g, a}) -> v != "" end)

    IO.inspect(points)
    Multi.new()
      |> Multi.insert_all(:insert_all, Game, points)
      |> Repo.transaction()

  end

  defp empty_to_zero("") do 0 end
  defp empty_to_zero(str) do String.to_integer(str) end

  defp put_mvp_flg(mvp_member_id, map) do
    target_member_id = Map.get(map, :member_id)
    case target_member_id do
      ^mvp_member_id -> Map.put(map, :mvp_flg, 1)
      _ -> Map.put(map, :mvp_flg, 0)
    end
  end

  defp empty_member(member) do
    val = Map.fetch!(member, :member_id)
    case val != "" do
      true -> member
      false -> false
    end
  end

end
