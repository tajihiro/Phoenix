defmodule SampleWeb.PrefectureControllerTest do
  use SampleWeb.ConnCase

  alias Sample.Account
  alias Sample.Account.Prefecture

  @create_attrs %{
    prefecture_name: "some prefecture_name"
  }
  @update_attrs %{
    prefecture_name: "some updated prefecture_name"
  }
  @invalid_attrs %{prefecture_name: nil}

  def fixture(:prefecture) do
    {:ok, prefecture} = Account.create_prefecture(@create_attrs)
    prefecture
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all prefectures", %{conn: conn} do
      conn = get(conn, Routes.prefecture_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create prefecture" do
    test "renders prefecture when data is valid", %{conn: conn} do
      conn = post(conn, Routes.prefecture_path(conn, :create), prefecture: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.prefecture_path(conn, :show, id))

      assert %{
               "id" => id,
               "prefecture_name" => "some prefecture_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.prefecture_path(conn, :create), prefecture: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update prefecture" do
    setup [:create_prefecture]

    test "renders prefecture when data is valid", %{conn: conn, prefecture: %Prefecture{id: id} = prefecture} do
      conn = put(conn, Routes.prefecture_path(conn, :update, prefecture), prefecture: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.prefecture_path(conn, :show, id))

      assert %{
               "id" => id,
               "prefecture_name" => "some updated prefecture_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, prefecture: prefecture} do
      conn = put(conn, Routes.prefecture_path(conn, :update, prefecture), prefecture: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete prefecture" do
    setup [:create_prefecture]

    test "deletes chosen prefecture", %{conn: conn, prefecture: prefecture} do
      conn = delete(conn, Routes.prefecture_path(conn, :delete, prefecture))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.prefecture_path(conn, :show, prefecture))
      end
    end
  end

  defp create_prefecture(_) do
    prefecture = fixture(:prefecture)
    {:ok, prefecture: prefecture}
  end
end
