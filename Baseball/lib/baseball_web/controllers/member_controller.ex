defmodule BaseballWeb.MemberController do
  use BaseballWeb, :controller

  alias Baseball.Scoresheets
  alias Baseball.Scoresheets.Member

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    members = Scoresheets.list_members()

    render(conn, "index.html", members: members)
  end

  def new(conn, _params) do
    changeset = Scoresheets.change_member(%Member{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"member" => member_params}) do
    case Scoresheets.create_member(member_params) do
      {:ok, member} ->
        conn
        |> put_flash(:info, "Member created successfully.")
        |> redirect(to: Routes.member_path(conn, :show, member))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    member = Scoresheets.get_member!(id)
    render(conn, "show.html", member: member)
  end

  def edit(conn, %{"id" => id}) do
    member = Scoresheets.get_member!(id)
    changeset = Scoresheets.change_member(member)
    render(conn, "edit.html", member: member, changeset: changeset)
  end

  def update(conn, %{"id" => id, "member" => member_params}) do
    member = Scoresheets.get_member!(id)

    case Scoresheets.update_member(member, member_params) do
      {:ok, member} ->
        conn
        |> put_flash(:info, "Member updated successfully.")
        |> redirect(to: Routes.member_path(conn, :show, member))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", member: member, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    member = Scoresheets.get_member!(id)
    {:ok, _member} = Scoresheets.delete_member(member)

    conn
    |> put_flash(:info, "Member deleted successfully.")
    |> redirect(to: Routes.member_path(conn, :index))
  end
end
