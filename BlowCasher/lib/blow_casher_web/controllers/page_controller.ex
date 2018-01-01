defmodule BlowCasherWeb.PageController do
  use BlowCasherWeb, :controller

  alias BlowCasher.Casher
  alias BlowCasher.Casher.Group
  alias BlowCasher.Casher.Item

  def index(conn, %{"crypto_id" => crypto_id}) do
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)
    item_id = conn.params["item_id"]
    price =
    case item_id do
      nil -> Casher.get_current_price_by_crypto_id!(crypto_id)
      _   -> Casher.get_current_price!(item_id)
    end
    # 商品情報取得
    items = Casher.list_items_by_crypto_id(crypto_id)
    render(conn, "index.html", [group: group, price: price, items: items])
  end

end
