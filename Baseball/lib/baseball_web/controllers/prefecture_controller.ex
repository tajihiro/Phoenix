defmodule BaseballWeb.PrefectureController do
  use BaseballWeb, :controller

  alias Baseball.Scoresheets
  alias Baseball.Scoresheets.Prefecture

  def index(conn, _params) do
    prefectures = Scoresheets.list_prefectures()
    render(conn, "index.html", prefectures: prefectures)
  end

  def new(conn, _params) do
    changeset = Scoresheets.change_prefecture(%Prefecture{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"prefecture" => prefecture_params}) do
    case Scoresheets.create_prefecture(prefecture_params) do
      {:ok, prefecture} ->
        conn
        |> put_flash(:info, "Prefecture created successfully.")
        |> redirect(to: Routes.prefecture_path(conn, :show, prefecture))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    prefecture = Scoresheets.get_prefecture!(id)
    render(conn, "show.html", prefecture: prefecture)
  end

  def edit(conn, %{"id" => id}) do
    prefecture = Scoresheets.get_prefecture!(id)
    changeset = Scoresheets.change_prefecture(prefecture)
    render(conn, "edit.html", prefecture: prefecture, changeset: changeset)
  end

  def update(conn, %{"id" => id, "prefecture" => prefecture_params}) do
    prefecture = Scoresheets.get_prefecture!(id)

    case Scoresheets.update_prefecture(prefecture, prefecture_params) do
      {:ok, prefecture} ->
        conn
        |> put_flash(:info, "Prefecture updated successfully.")
        |> redirect(to: Routes.prefecture_path(conn, :show, prefecture))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", prefecture: prefecture, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    prefecture = Scoresheets.get_prefecture!(id)
    {:ok, _prefecture} = Scoresheets.delete_prefecture(prefecture)

    conn
    |> put_flash(:info, "Prefecture deleted successfully.")
    |> redirect(to: Routes.prefecture_path(conn, :index))
  end
end
