defmodule BlowCasherWeb.GroupController do
  use BlowCasherWeb, :controller

  alias BlowCasher.Casher
  alias BlowCasher.Casher.Group

#  def index(conn, _params) do
#    groups = Casher.list_groups()
#    render(conn, "index.html", groups: groups)
#  end

  #
  # Group 登録画面表示
  #
  def new(conn, _params) do
    changeset = Casher.change_group(%Group{})
    render(conn, "new.html", [changeset: changeset, group: nil])
  end

  #
  # Group 登録処理
  #
  def create(conn, %{"group" => group_params}) do
    # group_id 生成処理
    crypto_id = create_crypto_id()
    delete_flg = 0
    group_params = Map.merge(%{"crypto_id" => crypto_id, "delete_flg" => delete_flg}, group_params)

    case Casher.create_group(group_params) do
      {:ok, group} ->
        conn
        |> put_flash(:info, "イベントが作成されました。")
        |> redirect(to: group_path(conn, :show, crypto_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  #
  # Group 表示処理
  #
  def show(conn, %{"crypto_id" => crypto_id}) do
#    group = Casher.get_group!(id)
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)
    render(conn, "show.html", [crypto_id: crypto_id, group: group])
  end

#  def edit(conn, %{"id" => id}) do
#    group = Casher.get_group!(id)
#    changeset = Casher.change_group(group)
#    render(conn, "edit.html", group: group, changeset: changeset)
#  end

#  def update(conn, %{"id" => id, "group" => group_params}) do
#    group = Casher.get_group!(id)
#
#    case Casher.update_group(group, group_params) do
#      {:ok, group} ->
#        conn
#        |> put_flash(:info, "Group updated successfully.")
#        |> redirect(to: group_path(conn, :show, group))
#      {:error, %Ecto.Changeset{} = changeset} ->
#        render(conn, "edit.html", group: group, changeset: changeset)
#    end
#  end
#
#  def delete(conn, %{"id" => id}) do
#    group = Casher.get_group!(id)
#    {:ok, _group} = Casher.delete_group(group)
#
#    conn
#    |> put_flash(:info, "Group deleted successfully.")
#    |> redirect(to: group_path(conn, :index))
#  end

  #
  # ランダム文字列生成
  #
  defp create_crypto_id() do
    length = 20
    :crypto.strong_rand_bytes(length)
      |> Base.encode64
      |> binary_part(0, length)
      |> String.replace("%","P")
      |> String.replace("/","S")
  end
end
