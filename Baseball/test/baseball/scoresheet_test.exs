defmodule Baseball.ScoresheetTest do
  use Baseball.DataCase

  alias Baseball.Scoresheet

  describe "members" do
    alias Baseball.Scoresheet.Member

    @valid_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name", password_digest: "some password_digest"}
    @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", password_digest: "some updated password_digest"}
    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, password_digest: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scoresheet.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Scoresheet.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Scoresheet.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Scoresheet.create_member(@valid_attrs)
      assert member.email == "some email"
      assert member.first_name == "some first_name"
      assert member.last_name == "some last_name"
      assert member.password_digest == "some password_digest"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scoresheet.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Scoresheet.update_member(member, @update_attrs)
      assert member.email == "some updated email"
      assert member.first_name == "some updated first_name"
      assert member.last_name == "some updated last_name"
      assert member.password_digest == "some updated password_digest"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Scoresheet.update_member(member, @invalid_attrs)
      assert member == Scoresheet.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Scoresheet.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Scoresheet.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Scoresheet.change_member(member)
    end
  end

  describe "teams" do
    alias Baseball.Scoresheet.Team

    @valid_attrs %{team_name: "some team_name"}
    @update_attrs %{team_name: "some updated team_name"}
    @invalid_attrs %{team_name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scoresheet.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Scoresheet.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Scoresheet.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Scoresheet.create_team(@valid_attrs)
      assert team.team_name == "some team_name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scoresheet.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = Scoresheet.update_team(team, @update_attrs)
      assert team.team_name == "some updated team_name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Scoresheet.update_team(team, @invalid_attrs)
      assert team == Scoresheet.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Scoresheet.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Scoresheet.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Scoresheet.change_team(team)
    end
  end
end
