defmodule Sample.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias Sample.Repo

  alias Sample.Account.Prefecture
  alias Sample.Account.Member

  @doc """
  Returns the list of members.

  ## Examples

      iex> list_members()
      [%Member{}, ...]

  """
  def list_members do
    Repo.all(Member)
      |> Repo.preload(:prefecture)
  end

  def list_prefectures do
    Repo.all(Prefecture)
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
  def get_member!(id) do
    Repo.get!(Member, id)
      |> Repo.preload(:prefecture)
  end

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

  alias Sample.Account.Team

  @doc """
  Returns the list of teams.

  ## Examples

      iex> list_teams()
      [%Team{}, ...]

  """
  def list_teams do
    Repo.all(Team)
  end

  @doc """
  Gets a single team.

  Raises `Ecto.NoResultsError` if the Team does not exist.

  ## Examples

      iex> get_team!(123)
      %Team{}

      iex> get_team!(456)
      ** (Ecto.NoResultsError)

  """
  def get_team!(id), do: Repo.get!(Team, id)

  @doc """
  Creates a team.

  ## Examples

      iex> create_team(%{field: value})
      {:ok, %Team{}}

      iex> create_team(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a team.

  ## Examples

      iex> update_team(team, %{field: new_value})
      {:ok, %Team{}}

      iex> update_team(team, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_team(%Team{} = team, attrs) do
    team
    |> Team.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a team.

  ## Examples

      iex> delete_team(team)
      {:ok, %Team{}}

      iex> delete_team(team)
      {:error, %Ecto.Changeset{}}

  """
  def delete_team(%Team{} = team) do
    Repo.delete(team)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking team changes.

  ## Examples

      iex> change_team(team)
      %Ecto.Changeset{source: %Team{}}

  """
  def change_team(%Team{} = team) do
    Team.changeset(team, %{})
  end

  alias Sample.Account.Prefecture

  @doc """
  Returns the list of prefectures.

  ## Examples

      iex> list_prefectures()
      [%Prefecture{}, ...]

  """
  def list_prefectures do
    Repo.all(Prefecture)
  end

  @doc """
  Gets a single prefecture.

  Raises `Ecto.NoResultsError` if the Prefecture does not exist.

  ## Examples

      iex> get_prefecture!(123)
      %Prefecture{}

      iex> get_prefecture!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prefecture!(id), do: Repo.get!(Prefecture, id)

  @doc """
  Creates a prefecture.

  ## Examples

      iex> create_prefecture(%{field: value})
      {:ok, %Prefecture{}}

      iex> create_prefecture(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prefecture(attrs \\ %{}) do
    %Prefecture{}
    |> Prefecture.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prefecture.

  ## Examples

      iex> update_prefecture(prefecture, %{field: new_value})
      {:ok, %Prefecture{}}

      iex> update_prefecture(prefecture, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prefecture(%Prefecture{} = prefecture, attrs) do
    prefecture
    |> Prefecture.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a prefecture.

  ## Examples

      iex> delete_prefecture(prefecture)
      {:ok, %Prefecture{}}

      iex> delete_prefecture(prefecture)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prefecture(%Prefecture{} = prefecture) do
    Repo.delete(prefecture)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prefecture changes.

  ## Examples

      iex> change_prefecture(prefecture)
      %Ecto.Changeset{source: %Prefecture{}}

  """
  def change_prefecture(%Prefecture{} = prefecture) do
    Prefecture.changeset(prefecture, %{})
  end
end
