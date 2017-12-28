defmodule BlowCasherWeb.PageController do
  use BlowCasherWeb, :controller

  alias BlowCasher.Casher
  alias BlowCasher.Casher.Group
  alias BlowCasher.Casher.Item

  def index(conn, %{"crypto_id" => crypto_id}) do
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)
    items = Casher.list_items_by_crypto_id(crypto_id)
    render(conn, "index.html", [group: group, items: items])
  end
end
