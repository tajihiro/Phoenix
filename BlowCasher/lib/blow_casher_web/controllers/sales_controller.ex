defmodule BlowCasherWeb.SalesController do
  use BlowCasherWeb, :controller

  alias BlowCasher.Casher
  alias BlowCasher.Casher.Sales
  alias BlowCasher.Casher.Group

  def index(conn, %{"crypto_id" => crypto_id}) do
    # Group取得
    group = BlowCasher.Repo.get_by!(Group, crypto_id: crypto_id)
    sales = Casher.list_sales_group_by_item_id(crypto_id)
    # 合計金額取得
    total =
      Casher.get_total_price(crypto_id)
        |> Map.get(:total) || 0

    render(conn, "index.html", sales: sales, crypto_id: crypto_id, group: group, total: total)
  end

  def new(conn, _params) do
    changeset = Casher.change_sales(%Sales{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sales" => sales_params}) do
    case Casher.create_sales(sales_params) do
      {:ok, sales} ->
        conn
        |> put_flash(:info, "Sales created successfully.")
        |> redirect(to: sales_path(conn, :show, sales))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sales = Casher.get_sales!(id)
    render(conn, "show.html", sales: sales)
  end

  def edit(conn, %{"id" => id}) do
    sales = Casher.get_sales!(id)
    changeset = Casher.change_sales(sales)
    render(conn, "edit.html", sales: sales, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sales" => sales_params}) do
    sales = Casher.get_sales!(id)

    case Casher.update_sales(sales, sales_params) do
      {:ok, sales} ->
        conn
        |> put_flash(:info, "Sales updated successfully.")
        |> redirect(to: sales_path(conn, :show, sales))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sales: sales, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sales = Casher.get_sales!(id)
    {:ok, _sales} = Casher.delete_sales(sales)

    conn
    |> put_flash(:info, "Sales deleted successfully.")
    |> redirect(to: sales_path(conn, :index))
  end
end
