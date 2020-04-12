defmodule ParamSample.SampleTest do
  use ParamSample.DataCase

  alias ParamSample.Sample

  describe "members" do
    alias ParamSample.Sample.Member

    @valid_attrs %{member_name: "some member_name"}
    @update_attrs %{member_name: "some updated member_name"}
    @invalid_attrs %{member_name: nil}

    def member_fixture(attrs \\ %{}) do
      {:ok, member} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sample.create_member()

      member
    end

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Sample.list_members() == [member]
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Sample.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Sample.create_member(@valid_attrs)
      assert member.member_name == "some member_name"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sample.create_member(@invalid_attrs)
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Sample.update_member(member, @update_attrs)
      assert member.member_name == "some updated member_name"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Sample.update_member(member, @invalid_attrs)
      assert member == Sample.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Sample.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Sample.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Sample.change_member(member)
    end
  end
end
