defmodule BlowCasherWeb.ItemController do
  use BlowCasherWeb, :controller

  alias BlowCasher.Casher
  alias BlowCasher.Casher.Item
  alias BlowCasher.Casher.Group

  #
  # Item一覧表示
  #
  def index(conn, _params) do
    crypto_id = _params["crypto_id"]
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)
    items = Casher.list_items_by_crypto_id(crypto_id)
    render(conn, "index.html", group: group, crypto_id: crypto_id, items: items)
  end
  #  def index(conn, _params) do
  #      items = Casher.list_items()
  #      render(conn, "index.html", items: items)
  #  end

  #
  # Item登録画面表示
  #
  def new(conn, %{"crypto_id" => crypto_id}) do
    # Group取得処理
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)
    #
    changeset = Casher.change_item(%Item{group_id: group.id, crypto_id: crypto_id})
    render(conn, "new.html", [changeset: changeset, crypto_id: crypto_id, group: group])
  end

  #
  # Item登録処理
  #
  def create(conn, %{"item" => item_params}) do
    crypto_id = item_params["crypto_id"]
    # Group取得処理
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)
      case Casher.create_item(item_params) do
        {:ok, item} ->
          conn
          |> put_flash(:info, "Item created successfully.")
          |> redirect(to: item_path(conn, :show, item.crypto_id))
        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset, crypto_id: crypto_id, group: group)
      end
  end

  def show(conn, %{"crypto_id" => crypto_id}) do
    item = Casher.get_item!(crypto_id)
    render(conn, "show.html", item: item)
  end

#  def show(conn, %{"id" => id}) do
#    item = Casher.get_item!(id)
#    render(conn, "show.html", item: item)
#  end

  #
  # Item更新画面表示
  #
  def edit(conn, %{"crypto_id"=> crypto_id, "item_id" => item_id}) do
    # Group取得処理
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)

    item = Casher.get_item!(item_id)
    changeset = Casher.change_item(item)
    render(conn, "edit.html", [item: item, changeset: changeset, crypto_id: crypto_id, group: group])
  end

  #
  # Item更新処理
  #
  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Casher.get_item!(id)

    case Casher.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: item_path(conn, :index, item.crypto_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

#  def delete(conn, %{"id" => id}) do
#    item = Casher.get_item!(id)
#    {:ok, _item} = Casher.delete_item(item)
#
#    conn
#    |> put_flash(:info, "Item deleted successfully.")
#    |> redirect(to: item_path(conn, :index))
#  end
end
