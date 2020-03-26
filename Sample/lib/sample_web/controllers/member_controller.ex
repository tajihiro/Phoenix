defmodule SampleWeb.MemberController do
  use SampleWeb, :controller

  plug :list_prefectures when action in [:new, :create, :edit]
  plug :list_genders when action in  [:new, :create, :edit]

  alias Sample.Account
  alias Sample.Account.Member

  def index(conn, _params) do
    members = Account.list_members()
    render(conn, "index.html", members: members)
  end

  def new(conn, _params) do
    changeset = Account.change_member(%Member{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"member" => member_params}) do
    case Account.create_member(member_params) do
      {:ok, member} ->
        conn
        |> put_flash(:info, "Member created successfully.")
        |> redirect(to: Routes.member_path(conn, :show, member))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    member = Account.get_member!(id)
    render(conn, "show.html", member: member)
  end

  def edit(conn, %{"id" => id}) do
    member = Account.get_member!(id)
    changeset = Account.change_member(member)
    render(conn, "edit.html", member: member, changeset: changeset)
  end

  def update(conn, %{"id" => id, "member" => member_params}) do
    member = Account.get_member!(id)

    case Account.update_member(member, member_params) do
      {:ok, member} ->
        conn
        |> put_flash(:info, "Member updated successfully.")
        |> redirect(to: Routes.member_path(conn, :show, member))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", member: member, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    member = Account.get_member!(id)
    {:ok, _member} = Account.delete_member(member)

    conn
    |> put_flash(:info, "Member deleted successfully.")
    |> redirect(to: Routes.member_path(conn, :index))
  end

  defp list_prefectures(conn, _) do
    prefectures = Account.list_prefectures()
    conn = assign(conn, :prefectures, prefectures)
  end

  defp list_genders(conn, _) do
    genders = %{male: 1, famale: 2, unknown: 0}
    conn = assign(conn, :genders, genders)
  end
end
