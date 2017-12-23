defmodule BlowCasherWeb.ItemController do
  use BlowCasherWeb, :controller

  alias BlowCasher.Casher
  alias BlowCasher.Casher.Item
  alias BlowCasher.Casher.Group


#  def index(conn, _params) do
#      items = Casher.list_items()
#      render(conn, "index.html", items: items)
#  end

  def index(conn, %{"crypto_id" => crypto_id}) do
#    crypto_id = _params["crypto_id"]
    items = Casher.list_items_by_crypto_id(crypto_id)

    render(conn, "index.html", items: items, crypto_id: crypto_id)
  end

  def new(conn, %{"crypto_id" => crypto_id}) do
    # Group取得処理
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)

    changeset = Casher.change_item(%Item{group_id: group.id, crypto_id: crypto_id})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    case Casher.create_item(item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: item_path(conn, :show, item))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Casher.get_item!(id)
    render(conn, "show.html", item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Casher.get_item!(id)
    changeset = Casher.change_item(item)
    render(conn, "edit.html", item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Casher.get_item!(id)

    case Casher.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: item_path(conn, :show, item))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Casher.get_item!(id)
    {:ok, _item} = Casher.delete_item(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: item_path(conn, :index))
  end
end
