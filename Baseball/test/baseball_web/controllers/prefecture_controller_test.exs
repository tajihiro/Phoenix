defmodule BaseballWeb.PrefectureControllerTest do
  use BaseballWeb.ConnCase

  alias Baseball.Scoresheets

  @create_attrs %{prefecture_name: "some prefecture_name"}
  @update_attrs %{prefecture_name: "some updated prefecture_name"}
  @invalid_attrs %{prefecture_name: nil}

  def fixture(:prefecture) do
    {:ok, prefecture} = Scoresheets.create_prefecture(@create_attrs)
    prefecture
  end

  describe "index" do
    test "lists all prefectures", %{conn: conn} do
      conn = get(conn, Routes.prefecture_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Prefectures"
    end
  end

  describe "new prefecture" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.prefecture_path(conn, :new))
      assert html_response(conn, 200) =~ "New Prefecture"
    end
  end

  describe "create prefecture" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.prefecture_path(conn, :create), prefecture: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.prefecture_path(conn, :show, id)

      conn = get(conn, Routes.prefecture_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Prefecture"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.prefecture_path(conn, :create), prefecture: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Prefecture"
    end
  end

  describe "edit prefecture" do
    setup [:create_prefecture]

    test "renders form for editing chosen prefecture", %{conn: conn, prefecture: prefecture} do
      conn = get(conn, Routes.prefecture_path(conn, :edit, prefecture))
      assert html_response(conn, 200) =~ "Edit Prefecture"
    end
  end

  describe "update prefecture" do
    setup [:create_prefecture]

    test "redirects when data is valid", %{conn: conn, prefecture: prefecture} do
      conn = put(conn, Routes.prefecture_path(conn, :update, prefecture), prefecture: @update_attrs)
      assert redirected_to(conn) == Routes.prefecture_path(conn, :show, prefecture)

      conn = get(conn, Routes.prefecture_path(conn, :show, prefecture))
      assert html_response(conn, 200) =~ "some updated prefecture_name"
    end

    test "renders errors when data is invalid", %{conn: conn, prefecture: prefecture} do
      conn = put(conn, Routes.prefecture_path(conn, :update, prefecture), prefecture: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Prefecture"
    end
  end

  describe "delete prefecture" do
    setup [:create_prefecture]

    test "deletes chosen prefecture", %{conn: conn, prefecture: prefecture} do
      conn = delete(conn, Routes.prefecture_path(conn, :delete, prefecture))
      assert redirected_to(conn) == Routes.prefecture_path(conn, :index)
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
