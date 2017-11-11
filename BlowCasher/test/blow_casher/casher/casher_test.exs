defmodule BlowCasher.CasherTest do
  use BlowCasher.DataCase

  alias BlowCasher.Casher

  describe "groups" do
    alias BlowCasher.Casher.Group

    @valid_attrs %{delete_flg: 42, group_id: "some group_id"}
    @update_attrs %{delete_flg: 43, group_id: "some updated group_id"}
    @invalid_attrs %{delete_flg: nil, group_id: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Casher.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Casher.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Casher.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Casher.create_group(@valid_attrs)
      assert group.delete_flg == 42
      assert group.group_id == "some group_id"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Casher.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, group} = Casher.update_group(group, @update_attrs)
      assert %Group{} = group
      assert group.delete_flg == 43
      assert group.group_id == "some updated group_id"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Casher.update_group(group, @invalid_attrs)
      assert group == Casher.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Casher.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Casher.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Casher.change_group(group)
    end
  end

  describe "items" do
    alias BlowCasher.Casher.Item

    @valid_attrs %{item_name: "some item_name"}
    @update_attrs %{item_name: "some updated item_name"}
    @invalid_attrs %{item_name: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Casher.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Casher.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Casher.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Casher.create_item(@valid_attrs)
      assert item.item_name == "some item_name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Casher.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Casher.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.item_name == "some updated item_name"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Casher.update_item(item, @invalid_attrs)
      assert item == Casher.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Casher.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Casher.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Casher.change_item(item)
    end
  end

  describe "prices" do
    alias BlowCasher.Casher.Price

    @valid_attrs %{price: "120.5"}
    @update_attrs %{price: "456.7"}
    @invalid_attrs %{price: nil}

    def price_fixture(attrs \\ %{}) do
      {:ok, price} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Casher.create_price()

      price
    end

    test "list_prices/0 returns all prices" do
      price = price_fixture()
      assert Casher.list_prices() == [price]
    end

    test "get_price!/1 returns the price with given id" do
      price = price_fixture()
      assert Casher.get_price!(price.id) == price
    end

    test "create_price/1 with valid data creates a price" do
      assert {:ok, %Price{} = price} = Casher.create_price(@valid_attrs)
      assert price.price == Decimal.new("120.5")
    end

    test "create_price/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Casher.create_price(@invalid_attrs)
    end

    test "update_price/2 with valid data updates the price" do
      price = price_fixture()
      assert {:ok, price} = Casher.update_price(price, @update_attrs)
      assert %Price{} = price
      assert price.price == Decimal.new("456.7")
    end

    test "update_price/2 with invalid data returns error changeset" do
      price = price_fixture()
      assert {:error, %Ecto.Changeset{}} = Casher.update_price(price, @invalid_attrs)
      assert price == Casher.get_price!(price.id)
    end

    test "delete_price/1 deletes the price" do
      price = price_fixture()
      assert {:ok, %Price{}} = Casher.delete_price(price)
      assert_raise Ecto.NoResultsError, fn -> Casher.get_price!(price.id) end
    end

    test "change_price/1 returns a price changeset" do
      price = price_fixture()
      assert %Ecto.Changeset{} = Casher.change_price(price)
    end
  end

  describe "sales" do
    alias BlowCasher.Casher.Sales

    @valid_attrs %{amount: "120.5", memo: "some memo", price: "120.5", unit: 42}
    @update_attrs %{amount: "456.7", memo: "some updated memo", price: "456.7", unit: 43}
    @invalid_attrs %{amount: nil, memo: nil, price: nil, unit: nil}

    def sales_fixture(attrs \\ %{}) do
      {:ok, sales} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Casher.create_sales()

      sales
    end

    test "list_sales/0 returns all sales" do
      sales = sales_fixture()
      assert Casher.list_sales() == [sales]
    end

    test "get_sales!/1 returns the sales with given id" do
      sales = sales_fixture()
      assert Casher.get_sales!(sales.id) == sales
    end

    test "create_sales/1 with valid data creates a sales" do
      assert {:ok, %Sales{} = sales} = Casher.create_sales(@valid_attrs)
      assert sales.amount == Decimal.new("120.5")
      assert sales.memo == "some memo"
      assert sales.price == Decimal.new("120.5")
      assert sales.unit == 42
    end

    test "create_sales/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Casher.create_sales(@invalid_attrs)
    end

    test "update_sales/2 with valid data updates the sales" do
      sales = sales_fixture()
      assert {:ok, sales} = Casher.update_sales(sales, @update_attrs)
      assert %Sales{} = sales
      assert sales.amount == Decimal.new("456.7")
      assert sales.memo == "some updated memo"
      assert sales.price == Decimal.new("456.7")
      assert sales.unit == 43
    end

    test "update_sales/2 with invalid data returns error changeset" do
      sales = sales_fixture()
      assert {:error, %Ecto.Changeset{}} = Casher.update_sales(sales, @invalid_attrs)
      assert sales == Casher.get_sales!(sales.id)
    end

    test "delete_sales/1 deletes the sales" do
      sales = sales_fixture()
      assert {:ok, %Sales{}} = Casher.delete_sales(sales)
      assert_raise Ecto.NoResultsError, fn -> Casher.get_sales!(sales.id) end
    end

    test "change_sales/1 returns a sales changeset" do
      sales = sales_fixture()
      assert %Ecto.Changeset{} = Casher.change_sales(sales)
    end
  end
end
