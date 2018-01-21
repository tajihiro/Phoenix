defmodule BlowCasherWeb.PriceController do
  use BlowCasherWeb, :controller

#  alias BlowCasher.Casher
#  alias BlowCasher.Casher.Price
#
#  def index(conn, _params) do
#    prices = Casher.list_prices()
#    render(conn, "index.html", prices: prices)
#  end
#
#  def new(conn, _params) do
#    changeset = Casher.change_price(%Price{})
#    render(conn, "new.html", changeset: changeset)
#  end
#
#  def create(conn, %{"price" => price_params}) do
#    case Casher.create_price(price_params) do
#      {:ok, price} ->
#        conn
#        |> put_flash(:info, "Price created successfully.")
#        |> redirect(to: price_path(conn, :show, price))
#      {:error, %Ecto.Changeset{} = changeset} ->
#        render(conn, "new.html", changeset: changeset)
#    end
#  end
#
#  def show(conn, %{"id" => id}) do
#    price = Casher.get_price!(id)
#    render(conn, "show.html", price: price)
#  end
#
#  def edit(conn, %{"id" => id}) do
#    price = Casher.get_price!(id)
#    changeset = Casher.change_price(price)
#    render(conn, "edit.html", price: price, changeset: changeset)
#  end
#
#  def update(conn, %{"id" => id, "price" => price_params}) do
#    price = Casher.get_price!(id)
#
#    case Casher.update_price(price, price_params) do
#      {:ok, price} ->
#        conn
#        |> put_flash(:info, "Price updated successfully.")
#        |> redirect(to: price_path(conn, :show, price))
#      {:error, %Ecto.Changeset{} = changeset} ->
#        render(conn, "edit.html", price: price, changeset: changeset)
#    end
#  end
#
#  def delete(conn, %{"id" => id}) do
#    price = Casher.get_price!(id)
#    {:ok, _price} = Casher.delete_price(price)
#
#    conn
#    |> put_flash(:info, "Price deleted successfully.")
#    |> redirect(to: price_path(conn, :index))
#  end
end
