defmodule Sample.AccountTest do
  use Sample.DataCase

  alias Sample.Account

  describe "members" do
    alias Sample.Account.Member

    @valid_attrs %{email: "some email", first_name: "some first_name", last_name: "some last_name", passwd: "some passwd"}
    @update_attrs %{email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", passwd: "some updated passwd"}
    @invalid_attrs %{email: nil, first_name: nil, last_name: nil, passwd: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Account.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Account.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Account.create_member(@valid_attrs)
      assert member.email == "some email"
      assert member.first_name == "some first_name"
      assert member.last_name == "some last_name"
      assert member.passwd == "some passwd"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Account.update_member(member, @update_attrs)
      assert member.email == "some updated email"
      assert member.first_name == "some updated first_name"
      assert member.last_name == "some updated last_name"
      assert member.passwd == "some updated passwd"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_member(member, @invalid_attrs)
      assert member == Account.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Account.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Account.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Account.change_member(member)
    end
  end

  describe "teams" do
    alias Sample.Account.Team

    @valid_attrs %{team_name: "some team_name"}
    @update_attrs %{team_name: "some updated team_name"}
    @invalid_attrs %{team_name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Account.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Account.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Account.create_team(@valid_attrs)
      assert team.team_name == "some team_name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, %Team{} = team} = Account.update_team(team, @update_attrs)
      assert team.team_name == "some updated team_name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_team(team, @invalid_attrs)
      assert team == Account.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Account.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Account.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Account.change_team(team)
    end
  end

  describe "prefectures" do
    alias Sample.Account.Prefecture

    @valid_attrs %{prefecture_name: "some prefecture_name"}
    @update_attrs %{prefecture_name: "some updated prefecture_name"}
    @invalid_attrs %{prefecture_name: nil}

    def prefecture_fixture(attrs \\ %{}) do
      {:ok, prefecture} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_prefecture()

      prefecture
    end

    test "list_prefectures/0 returns all prefectures" do
      prefecture = prefecture_fixture()
      assert Account.list_prefectures() == [prefecture]
    end

    test "get_prefecture!/1 returns the prefecture with given id" do
      prefecture = prefecture_fixture()
      assert Account.get_prefecture!(prefecture.id) == prefecture
    end

    test "create_prefecture/1 with valid data creates a prefecture" do
      assert {:ok, %Prefecture{} = prefecture} = Account.create_prefecture(@valid_attrs)
      assert prefecture.prefecture_name == "some prefecture_name"
    end

    test "create_prefecture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_prefecture(@invalid_attrs)
    end

    test "update_prefecture/2 with valid data updates the prefecture" do
      prefecture = prefecture_fixture()
      assert {:ok, %Prefecture{} = prefecture} = Account.update_prefecture(prefecture, @update_attrs)
      assert prefecture.prefecture_name == "some updated prefecture_name"
    end

    test "update_prefecture/2 with invalid data returns error changeset" do
      prefecture = prefecture_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_prefecture(prefecture, @invalid_attrs)
      assert prefecture == Account.get_prefecture!(prefecture.id)
    end

    test "delete_prefecture/1 deletes the prefecture" do
      prefecture = prefecture_fixture()
      assert {:ok, %Prefecture{}} = Account.delete_prefecture(prefecture)
      assert_raise Ecto.NoResultsError, fn -> Account.get_prefecture!(prefecture.id) end
    end

    test "change_prefecture/1 returns a prefecture changeset" do
      prefecture = prefecture_fixture()
      assert %Ecto.Changeset{} = Account.change_prefecture(prefecture)
    end
  end
end
