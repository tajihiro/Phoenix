defmodule ReactPhoenixReduxWeb.MemberController do
  use ReactPhoenixReduxWeb, :controller

  alias ReactPhoenixRedux.Redux
  alias ReactPhoenixRedux.Redux.Member

  action_fallback ReactPhoenixReduxWeb.FallbackController

  def index(conn, _params) do
    members = Redux.list_members()
    render(conn, "index.json", members: members)
  end

  def create(conn, %{"member" => member_params}) do
    with {:ok, %Member{} = member} <- Redux.create_member(member_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.member_path(conn, :show, member))
      |> render("show.json", member: member)
    end
  end

  def show(conn, %{"id" => id}) do
    member = Redux.get_member!(id)
    render(conn, "show.json", member: member)
  end

  def update(conn, %{"id" => id, "member" => member_params}) do
    member = Redux.get_member!(id)

    with {:ok, %Member{} = member} <- Redux.update_member(member, member_params) do
      render(conn, "show.json", member: member)
    end
  end

  def delete(conn, %{"id" => id}) do
    member = Redux.get_member!(id)

    with {:ok, %Member{}} <- Redux.delete_member(member) do
      send_resp(conn, :no_content, "")
    end
  end
end
