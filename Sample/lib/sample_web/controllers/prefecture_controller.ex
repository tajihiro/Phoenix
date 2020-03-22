defmodule SampleWeb.PrefectureController do
  use SampleWeb, :controller

  alias Sample.Account
  alias Sample.Account.Prefecture

  action_fallback SampleWeb.FallbackController

  def index(conn, _params) do
    prefectures = Account.list_prefectures()
    render(conn, "index.json", prefectures: prefectures)
  end

  def create(conn, %{"prefecture" => prefecture_params}) do
    with {:ok, %Prefecture{} = prefecture} <- Account.create_prefecture(prefecture_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.prefecture_path(conn, :show, prefecture))
      |> render("show.json", prefecture: prefecture)
    end
  end

  def show(conn, %{"id" => id}) do
    prefecture = Account.get_prefecture!(id)
    render(conn, "show.json", prefecture: prefecture)
  end

  def update(conn, %{"id" => id, "prefecture" => prefecture_params}) do
    prefecture = Account.get_prefecture!(id)

    with {:ok, %Prefecture{} = prefecture} <- Account.update_prefecture(prefecture, prefecture_params) do
      render(conn, "show.json", prefecture: prefecture)
    end
  end

  def delete(conn, %{"id" => id}) do
    prefecture = Account.get_prefecture!(id)

    with {:ok, %Prefecture{}} <- Account.delete_prefecture(prefecture) do
      send_resp(conn, :no_content, "")
    end
  end
end
