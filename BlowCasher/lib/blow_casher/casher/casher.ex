defmodule BlowCasher.Casher do
  @moduledoc """
  The Casher context.
  """

  import Ecto.Query, warn: false
  alias BlowCasher.Repo

  alias BlowCasher.Casher.Group

  @doc """
  Returns the list of groups.

  ## Examples

      iex> list_groups()
      [%Group{}, ...]

  """
  def list_groups do
    Repo.all(Group)
  end

  @doc """
  Gets a single group.

  Raises `Ecto.NoResultsError` if the Group does not exist.

  ## Examples

      iex> get_group!(123)
      %Group{}

      iex> get_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_group!(id), do: Repo.get!(Group, id)

  @doc """
  Creates a group.

  ## Examples

      iex> create_group(%{field: value})
      {:ok, %Group{}}

      iex> create_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a group.

  ## Examples

      iex> update_group(group, %{field: new_value})
      {:ok, %Group{}}

      iex> update_group(group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_group(%Group{} = group, attrs) do
    group
    |> Group.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Group.

  ## Examples

      iex> delete_group(group)
      {:ok, %Group{}}

      iex> delete_group(group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_group(%Group{} = group) do
    Repo.delete(group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking group changes.

  ## Examples

      iex> change_group(group)
      %Ecto.Changeset{source: %Group{}}

  """
  def change_group(%Group{} = group) do
    Group.changeset(group, %{})
  end

  alias BlowCasher.Casher.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    Repo.all(Item)
  end


  def list_items_by_crypto_id(crypto_id) do
    Repo.all(from i in "items",
             left_join: p in "prices",
                    on: i.id == p.item_id,
                 where: i.crypto_id == ^crypto_id,
                select: %{id: i.id,
                          group_id: i.group_id,
                          crypto_id: i.crypto_id,
                          item_name: i.item_name,
                          price: p.price })
  end


  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{source: %Item{}}

  """
  def change_item(%Item{} = item) do
    Item.changeset(item, %{})
  end

  alias BlowCasher.Casher.Price

  @doc """
  Returns the list of prices.

  ## Examples

      iex> list_prices()
      [%Price{}, ...]

  """
  def list_prices do
    Repo.all(Price)
  end


  @doc """
  Gets a single price.

  Raises `Ecto.NoResultsError` if the Price does not exist.

  ## Examples

      iex> get_price!(123)
      %Price{}

      iex> get_price!(456)
      ** (Ecto.NoResultsError)

  """
  def get_price!(id), do: Repo.get!(Price, id)


  def get_current_price!(item_id) do
    Repo.one!(from p in "prices",
              where: p.item_id == ^item_id,
           order_by: [p.id],
             select: %{id: max(p.id), price: p.price})
  end


  def get_current_price_by_crypto_id!(crypto_id) do
    Repo.one!(from i in "items",
             left_join: p in "prices",
                    on: i.id == p.item_id,
                 where: i.crypto_id == ^crypto_id,
              order_by: [p.id],
                select: %{id: max(p.id), price: p.price})
  end

  @doc """
  Creates a price.

  ## Examples

      iex> create_price(%{field: value})
      {:ok, %Price{}}

      iex> create_price(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_price(attrs \\ %{}) do
    %Price{}
    |> Price.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a price.

  ## Examples

      iex> update_price(price, %{field: new_value})
      {:ok, %Price{}}

      iex> update_price(price, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_price(%Price{} = price, attrs) do
    price
    |> Price.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Price.

  ## Examples

      iex> delete_price(price)
      {:ok, %Price{}}

      iex> delete_price(price)
      {:error, %Ecto.Changeset{}}

  """
  def delete_price(%Price{} = price) do
    Repo.delete(price)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking price changes.

  ## Examples

      iex> change_price(price)
      %Ecto.Changeset{source: %Price{}}

  """
  def change_price(%Price{} = price) do
    Price.changeset(price, %{})
  end

  alias BlowCasher.Casher.Sales

  @doc """
  Returns the list of sales.

  ## Examples

      iex> list_sales()
      [%Sales{}, ...]

  """
  def list_sales do
    Repo.all(Sales)
  end

  @doc """
  Gets a single sales.

  Raises `Ecto.NoResultsError` if the Sales does not exist.

  ## Examples

      iex> get_sales!(123)
      %Sales{}

      iex> get_sales!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sales!(id), do: Repo.get!(Sales, id)

  @doc """
  Creates a sales.

  ## Examples

      iex> create_sales(%{field: value})
      {:ok, %Sales{}}

      iex> create_sales(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sales(attrs \\ %{}) do
    %Sales{}
    |> Sales.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sales.

  ## Examples

      iex> update_sales(sales, %{field: new_value})
      {:ok, %Sales{}}

      iex> update_sales(sales, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sales(%Sales{} = sales, attrs) do
    sales
    |> Sales.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sales.

  ## Examples

      iex> delete_sales(sales)
      {:ok, %Sales{}}

      iex> delete_sales(sales)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sales(%Sales{} = sales) do
    Repo.delete(sales)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sales changes.

  ## Examples

      iex> change_sales(sales)
      %Ecto.Changeset{source: %Sales{}}

  """
  def change_sales(%Sales{} = sales) do
    Sales.changeset(sales, %{})
  end
end
