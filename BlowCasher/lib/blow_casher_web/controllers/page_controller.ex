defmodule BlowCasherWeb.PageController do
  use BlowCasherWeb, :controller

  alias BlowCasher.Casher
  alias BlowCasher.Casher.Group

  def index(conn, %{"crypto_id" => crypto_id}) do
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)
    render(conn, "index.html", group: group)
  end
end
