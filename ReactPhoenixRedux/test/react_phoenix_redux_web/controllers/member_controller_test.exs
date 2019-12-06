defmodule ReactPhoenixReduxWeb.MemberControllerTest do
  use ReactPhoenixReduxWeb.ConnCase

  alias ReactPhoenixRedux.Redux
  alias ReactPhoenixRedux.Redux.Member

  @create_attrs %{
    email: "some email",
    first_name: "some first_name",
    last_name: "some last_name",
    passwd: "some passwd"
  }
  @update_attrs %{
    email: "some updated email",
    first_name: "some updated first_name",
    last_name: "some updated last_name",
    passwd: "some updated passwd"
  }
  @invalid_attrs %{email: nil, first_name: nil, last_name: nil, passwd: nil}

  def fixture(:member) do
    {:ok, member} = Redux.create_member(@create_attrs)
    member
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all members", %{conn: conn} do
      conn = get(conn, Routes.member_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create member" do
    test "renders member when data is valid", %{conn: conn} do
      conn = post(conn, Routes.member_path(conn, :create), member: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.member_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some email",
               "first_name" => "some first_name",
               "last_name" => "some last_name",
               "passwd" => "some passwd"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.member_path(conn, :create), member: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update member" do
    setup [:create_member]

    test "renders member when data is valid", %{conn: conn, member: %Member{id: id} = member} do
      conn = put(conn, Routes.member_path(conn, :update, member), member: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.member_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some updated email",
               "first_name" => "some updated first_name",
               "last_name" => "some updated last_name",
               "passwd" => "some updated passwd"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, member: member} do
      conn = put(conn, Routes.member_path(conn, :update, member), member: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete member" do
    setup [:create_member]

    test "deletes chosen member", %{conn: conn, member: member} do
      conn = delete(conn, Routes.member_path(conn, :delete, member))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.member_path(conn, :show, member))
      end
    end
  end

  defp create_member(_) do
    member = fixture(:member)
    {:ok, member: member}
  end
end
