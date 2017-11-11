defmodule BlowCasherWeb.PriceControllerTest do
  use BlowCasherWeb.ConnCase

  alias BlowCasher.Casher

  @create_attrs %{price: "120.5"}
  @update_attrs %{price: "456.7"}
  @invalid_attrs %{price: nil}

  def fixture(:price) do
    {:ok, price} = Casher.create_price(@create_attrs)
    price
  end

  describe "index" do
    test "lists all prices", %{conn: conn} do
      conn = get conn, price_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Prices"
    end
  end

  describe "new price" do
    test "renders form", %{conn: conn} do
      conn = get conn, price_path(conn, :new)
      assert html_response(conn, 200) =~ "New Price"
    end
  end

  describe "create price" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, price_path(conn, :create), price: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == price_path(conn, :show, id)

      conn = get conn, price_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Price"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, price_path(conn, :create), price: @invalid_attrs
      assert html_response(conn, 200) =~ "New Price"
    end
  end

  describe "edit price" do
    setup [:create_price]

    test "renders form for editing chosen price", %{conn: conn, price: price} do
      conn = get conn, price_path(conn, :edit, price)
      assert html_response(conn, 200) =~ "Edit Price"
    end
  end

  describe "update price" do
    setup [:create_price]

    test "redirects when data is valid", %{conn: conn, price: price} do
      conn = put conn, price_path(conn, :update, price), price: @update_attrs
      assert redirected_to(conn) == price_path(conn, :show, price)

      conn = get conn, price_path(conn, :show, price)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, price: price} do
      conn = put conn, price_path(conn, :update, price), price: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Price"
    end
  end

  describe "delete price" do
    setup [:create_price]

    test "deletes chosen price", %{conn: conn, price: price} do
      conn = delete conn, price_path(conn, :delete, price)
      assert redirected_to(conn) == price_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, price_path(conn, :show, price)
      end
    end
  end

  defp create_price(_) do
    price = fixture(:price)
    {:ok, price: price}
  end
end
