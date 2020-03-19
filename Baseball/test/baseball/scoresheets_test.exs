defmodule Baseball.ScoresheetsTest do
  use Baseball.DataCase

  alias Baseball.Scoresheets

  describe "members" do
    alias Baseball.Scoresheets.Member

    @valid_attrs %{first_name: "some first_name", last_name: "some last_name"}
    @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name"}
    @invalid_attrs %{first_name: nil, last_name: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scoresheets.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Scoresheets.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Scoresheets.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Scoresheets.create_member(@valid_attrs)
      assert member.first_name == "some first_name"
      assert member.last_name == "some last_name"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scoresheets.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Scoresheets.update_member(member, @update_attrs)
      assert member.first_name == "some updated first_name"
      assert member.last_name == "some updated last_name"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Scoresheets.update_member(member, @invalid_attrs)
      assert member == Scoresheets.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Scoresheets.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Scoresheets.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Scoresheets.change_member(member)
    end
  end

  describe "prefectures" do
    alias Baseball.Scoresheets.Prefecture

    @valid_attrs %{prefecture_name: "some prefecture_name"}
    @update_attrs %{prefecture_name: "some updated prefecture_name"}
    @invalid_attrs %{prefecture_name: nil}

    def prefecture_fixture(attrs \\ %{}) do
      {:ok, prefecture} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scoresheets.create_prefecture()

      prefecture
    end

    test "list_prefectures/0 returns all prefectures" do
      prefecture = prefecture_fixture()
      assert Scoresheets.list_prefectures() == [prefecture]
    end

    test "get_prefecture!/1 returns the prefecture with given id" do
      prefecture = prefecture_fixture()
      assert Scoresheets.get_prefecture!(prefecture.id) == prefecture
    end

    test "create_prefecture/1 with valid data creates a prefecture" do
      assert {:ok, %Prefecture{} = prefecture} = Scoresheets.create_prefecture(@valid_attrs)
      assert prefecture.prefecture_name == "some prefecture_name"
    end

    test "create_prefecture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scoresheets.create_prefecture(@invalid_attrs)
    end

    test "update_prefecture/2 with valid data updates the prefecture" do
      prefecture = prefecture_fixture()
      assert {:ok, %Prefecture{} = prefecture} = Scoresheets.update_prefecture(prefecture, @update_attrs)
      assert prefecture.prefecture_name == "some updated prefecture_name"
    end

    test "update_prefecture/2 with invalid data returns error changeset" do
      prefecture = prefecture_fixture()
      assert {:error, %Ecto.Changeset{}} = Scoresheets.update_prefecture(prefecture, @invalid_attrs)
      assert prefecture == Scoresheets.get_prefecture!(prefecture.id)
    end

    test "delete_prefecture/1 deletes the prefecture" do
      prefecture = prefecture_fixture()
      assert {:ok, %Prefecture{}} = Scoresheets.delete_prefecture(prefecture)
      assert_raise Ecto.NoResultsError, fn -> Scoresheets.get_prefecture!(prefecture.id) end
    end

    test "change_prefecture/1 returns a prefecture changeset" do
      prefecture = prefecture_fixture()
      assert %Ecto.Changeset{} = Scoresheets.change_prefecture(prefecture)
    end
  end

  describe "teams" do
    alias Baseball.Scoresheets.Team

    @valid_attrs %{team_name: "some team_name"}
    @update_attrs %{team_name: "some updated team_name"}
    @invalid_attrs %{team_name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Scoresheets.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Scoresheets.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Scoresheets.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Scoresheets.create_team(@valid_attrs)
      assert team.team_name == "some team_name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scoresheets.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = Scoresheets.update_team(team, @update_attrs)
      assert team.team_name == "some updated team_name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Scoresheets.update_team(team, @invalid_attrs)
      assert team == Scoresheets.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Scoresheets.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Scoresheets.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Scoresheets.change_team(team)
    end
  end
end
