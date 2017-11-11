defmodule BlowCasherWeb.SalesControllerTest do
  use BlowCasherWeb.ConnCase

  alias BlowCasher.Casher

  @create_attrs %{amount: "120.5", memo: "some memo", price: "120.5", unit: 42}
  @update_attrs %{amount: "456.7", memo: "some updated memo", price: "456.7", unit: 43}
  @invalid_attrs %{amount: nil, memo: nil, price: nil, unit: nil}

  def fixture(:sales) do
    {:ok, sales} = Casher.create_sales(@create_attrs)
    sales
  end

  describe "index" do
    test "lists all sales", %{conn: conn} do
      conn = get conn, sales_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Sales"
    end
  end

  describe "new sales" do
    test "renders form", %{conn: conn} do
      conn = get conn, sales_path(conn, :new)
      assert html_response(conn, 200) =~ "New Sales"
    end
  end

  describe "create sales" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, sales_path(conn, :create), sales: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == sales_path(conn, :show, id)

      conn = get conn, sales_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Sales"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sales_path(conn, :create), sales: @invalid_attrs
      assert html_response(conn, 200) =~ "New Sales"
    end
  end

  describe "edit sales" do
    setup [:create_sales]

    test "renders form for editing chosen sales", %{conn: conn, sales: sales} do
      conn = get conn, sales_path(conn, :edit, sales)
      assert html_response(conn, 200) =~ "Edit Sales"
    end
  end

  describe "update sales" do
    setup [:create_sales]

    test "redirects when data is valid", %{conn: conn, sales: sales} do
      conn = put conn, sales_path(conn, :update, sales), sales: @update_attrs
      assert redirected_to(conn) == sales_path(conn, :show, sales)

      conn = get conn, sales_path(conn, :show, sales)
      assert html_response(conn, 200) =~ "some updated memo"
    end

    test "renders errors when data is invalid", %{conn: conn, sales: sales} do
      conn = put conn, sales_path(conn, :update, sales), sales: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Sales"
    end
  end

  describe "delete sales" do
    setup [:create_sales]

    test "deletes chosen sales", %{conn: conn, sales: sales} do
      conn = delete conn, sales_path(conn, :delete, sales)
      assert redirected_to(conn) == sales_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, sales_path(conn, :show, sales)
      end
    end
  end

  defp create_sales(_) do
    sales = fixture(:sales)
    {:ok, sales: sales}
  end
end
