defmodule BlowCasherWeb.PageController do
  use BlowCasherWeb, :controller

  alias BlowCasher.Casher
  alias BlowCasher.Casher.Group
  alias BlowCasher.Casher.Item
  alias BlowCasher.Casher.Sales

  def index(conn, %{"crypto_id" => crypto_id}) do
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)

    #金額取得
    item_id = conn.params["item_id"]
    price =
    case item_id do
      nil -> Casher.get_item_price_by_crypto_id!(crypto_id)
      _   -> Casher.get_item_price!(item_id)
    end

    # 商品情報取得
    items = Casher.list_items_by_crypto_id(crypto_id)
    render(conn, "index.html", [crypto_id: crypto_id, group: group, price: price, items: items])
  end

  # Sales登録
  def create(conn, _params) do
    crypto_id = _params["crypto_id"]
    price = _params["price"]
    unit = _params["unit"]
    amount = _params["amount"]
    memo = _params["memo"]
    item_id = _params["item_id"]
    sales = %{price: price,
                   unit: unit,
                   amount: amount,
                   memo: memo,
                   item_id: item_id}
    case Casher.create_sales(sales) do
      {:ok, sales} ->
      conn
        |> put_flash(:info, "Updated successfully.")
        |> redirect(to: page_path(conn, :index, crypto_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", crypto_id: crypto_id)
    end
  end

end
