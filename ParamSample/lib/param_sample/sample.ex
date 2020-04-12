defmodule ParamSample.Sample do
  @moduledoc """
  The Sample context.
  """

  import Ecto.Query, warn: false
  alias ParamSample.Repo

  alias ParamSample.Sample.Member
  alias ParamSample.Sample.Game

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
    points =
      Enum.zip([attrs["member_id"], attrs["goal"], attrs["assist"]])
        |> Enum.map(fn({m, g, a}) -> {m, empty_to_zero(g), empty_to_zero(a)} end)
        |> Enum.map(fn({m, g, a}) -> %{member_id: m, goal: g, assist: a} end)
    Repo.insert_all(Game, points, timestamps: true)

#    %Game{}
#    |> Game.changeset(attrs)
#    |> Repo.insert()
  end

  defp empty_to_zero("") do 0 end
  defp empty_to_zero(str) do String.to_integer(str) end

end
