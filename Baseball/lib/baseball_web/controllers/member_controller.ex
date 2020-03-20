defmodule BaseballWeb.MemberController do
  use BaseballWeb, :controller

  plug :list_prefectures when action in [:new, :edit]

  alias Baseball.Scoresheet
  alias Baseball.Scoresheet.Member

  def index(conn, _params) do
    members = Scoresheet.list_members()
    render(conn, "index.html", members: members)
  end

  def new(conn, _params) do
    changeset = Scoresheet.change_member(%Member{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"member" => member_params}) do
    case Scoresheet.create_member(member_params) do
      {:ok, member} ->
        conn
        |> put_flash(:info, "Member created successfully.")
        |> redirect(to: Routes.member_path(conn, :show, member))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    member = Scoresheet.get_member!(id)
    render(conn, "show.html", member: member)
  end

  def edit(conn, %{"id" => id}) do
    member = Scoresheet.get_member!(id)
    changeset = Scoresheet.change_member(member)
    render(conn, "edit.html", member: member, changeset: changeset)
  end

  def update(conn, %{"id" => id, "member" => member_params}) do
    member = Scoresheet.get_member!(id)

    case Scoresheet.update_member(member, member_params) do
      {:ok, member} ->
        conn
        |> put_flash(:info, "Member updated successfully.")
        |> redirect(to: Routes.member_path(conn, :show, member))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", member: member, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    member = Scoresheet.get_member!(id)
    {:ok, _member} = Scoresheet.delete_member(member)

    conn
    |> put_flash(:info, "Member deleted successfully.")
    |> redirect(to: Routes.member_path(conn, :index))
  end

  defp list_prefectures(conn, _) do
    prefectures = Scoresheet.list_prefectures()
    conn = assign(conn, :prefectures, prefectures)
  end

end
