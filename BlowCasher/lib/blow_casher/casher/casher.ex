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
                 where: i.crypto_id == ^crypto_id,
                 order_by: [i.id],
                select: %{id: i.id,
                          group_id: i.group_id,
                          crypto_id: i.crypto_id,
                          item_name: i.item_name,
                          price: i.price })
#    Repo.all(from i in "items",
#             left_join: p in "prices",
#                    on: i.id == p.item_id,
#                 where: i.crypto_id == ^crypto_id,
#                select: %{id: i.id,
#                          group_id: i.group_id,
#                          crypto_id: i.crypto_id,
#                          item_name: i.item_name,
#                          price: p.price })
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


  def get_item_price!(id) do
      Repo.one!(from i in "items",
                where: i.id == ^id,
                order_by: [i.id],
                select: %{id: max(i.id), price: i.price})
  end

  def get_item_price_by_crypto_id!(crypto_id) do
    Repo.one!(from i in "items",
                 where: i.crypto_id == ^crypto_id,
              order_by: [i.id],
                select: %{id: max(i.id), price: i.price})
  end

  def has_items!(crypto_id) do
    count = Repo.one!(from i in "items",
                    where: i.crypto_id ==^crypto_id,
                   select: count("*"))
    case count do
      0 -> false
      _ -> true
    end
  end

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

#  def get_current_price!(item_id) do
#    Repo.one!(from p in "prices",
#              where: p.item_id == ^item_id,
#           order_by: [p.id],
#             select: %{id: max(p.id), price: p.price})
#  end


#  def get_current_price_by_crypto_id!(crypto_id) do
#    Repo.one!(from i in "items",
#             left_join: p in "prices",
#                    on: i.id == p.item_id,
#                 where: i.crypto_id == ^crypto_id,
#              order_by: [p.id],
#                select: %{id: max(p.id), price: p.price})
#  end


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

  def list_sales_group_by_item_id(crypto_id) do
    Repo.all(from s in "sales",
             left_join: i in "items",
                    on: i.id == s.item_id,
             where: i.crypto_id == ^crypto_id,
             group_by: [i.id],
             select: %{id: s.id,
                       unit: sum(s.unit),
                       amount: sum(s.amount),
                       item_id: s.item_id,
                       item_name: i.item_name,
                       price: i.price })
  end

  def get_total_price(crypto_id) do
    Repo.one(from s in "sales",
             left_join: i in "items",
                    on: i.id == s.item_id,
                 where: i.crypto_id == ^crypto_id,
                select: %{total: sum(s.amount)})
  end

  def get_sales_hours(item_id) do
    query =
      """
      select S.item_id, I.item_name,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0000 and date_format(S.inserted_at, '%H%i') < 0030)
             then S.unit
             else 0 end) as h0900,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0030 and date_format(S.inserted_at, '%H%i') < 0100)
             then S.unit
               else 0 end) as h0930,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0100 and date_format(S.inserted_at, '%H%i') < 0130)
             then S.unit
               else 0 end) as h1000,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0130 and date_format(S.inserted_at, '%H%i') < 0200)
             then S.unit
               else 0 end) as h1030,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0200 and date_format(S.inserted_at, '%H%i') < 0230)
             then S.unit
               else 0 end) as h1100,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0230 and date_format(S.inserted_at, '%H%i') < 0300)
             then S.unit
               else 0 end) as h1130,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0300 and date_format(S.inserted_at, '%H%i') < 0330)
             then S.unit
               else 0 end) as h1200,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0330 and date_format(S.inserted_at, '%H%i') < 0400)
             then S.unit
               else 0 end) as h1230,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0400 and date_format(S.inserted_at, '%H%i') < 0430)
             then S.unit
               else 0 end) as h1300,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0430 and date_format(S.inserted_at, '%H%i') < 0500)
             then S.unit
               else 0 end) as h1330,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0500 and date_format(S.inserted_at, '%H%i') < 0530)
             then S.unit
               else 0 end) as h1400,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0530 and date_format(S.inserted_at, '%H%i') < 0600)
             then S.unit
               else 0 end) as h1430,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0600 and date_format(S.inserted_at, '%H%i') < 0630)
             then S.unit
               else 0 end) as h1500,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0630 and date_format(S.inserted_at, '%H%i') < 0700)
             then S.unit
               else 0 end) as h1530,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0700 and date_format(S.inserted_at, '%H%i') < 0730)
             then S.unit
               else 0 end) as h1600,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0730 and date_format(S.inserted_at, '%H%i') < 0800)
             then S.unit
               else 0 end) as h1630,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0800 and date_format(S.inserted_at, '%H%i') < 0830)
             then S.unit
               else 0 end) as h1700,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0830 and date_format(S.inserted_at, '%H%i') < 0900)
             then S.unit
               else 0 end) as h1730,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0900 and date_format(S.inserted_at, '%H%i') < 0930)
             then S.unit
               else 0 end) as h1800,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 0930 and date_format(S.inserted_at, '%H%i') < 1000)
             then S.unit
               else 0 end) as h1830,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1000 and date_format(S.inserted_at, '%H%i') < 1030)
             then S.unit
               else 0 end) as h1900,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1030 and date_format(S.inserted_at, '%H%i') < 1100)
             then S.unit
               else 0 end) as h1930,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1100 and date_format(S.inserted_at, '%H%i') < 1130)
             then S.unit
               else 0 end) as h2000,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1130 and date_format(S.inserted_at, '%H%i') < 1200)
             then S.unit
               else 0 end) as h2030,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1200 and date_format(S.inserted_at, '%H%i') < 1230)
             then S.unit
               else 0 end) as h2100,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1230 and date_format(S.inserted_at, '%H%i') < 1300)
             then S.unit
               else 0 end) as h2130,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1300 and date_format(S.inserted_at, '%H%i') < 1330)
             then S.unit
               else 0 end) as h2200,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1330 and date_format(S.inserted_at, '%H%i') < 1400)
             then S.unit
               else 0 end) as h2230,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1400 and date_format(S.inserted_at, '%H%i') < 1430)
             then S.unit
               else 0 end) as h2300,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1430 and date_format(S.inserted_at, '%H%i') < 1500)
             then S.unit
               else 0 end) as h2330,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1500 and date_format(S.inserted_at, '%H%i') < 1530)
             then S.unit
               else 0 end) as h0000,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1530 and date_format(S.inserted_at, '%H%i') < 1600)
             then S.unit
               else 0 end) as h0030,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1600 and date_format(S.inserted_at, '%H%i') < 1630)
             then S.unit
               else 0 end) as h0100,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1630 and date_format(S.inserted_at, '%H%i') < 1700)
             then S.unit
               else 0 end) as h0130,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1700 and date_format(S.inserted_at, '%H%i') < 1730)
             then S.unit
               else 0 end) as h0200,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1730 and date_format(S.inserted_at, '%H%i') < 1800)
             then S.unit
               else 0 end) as h0230,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1800 and date_format(S.inserted_at, '%H%i') < 1830)
             then S.unit
               else 0 end) as h0300,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1830 and date_format(S.inserted_at, '%H%i') < 1900)
             then S.unit
               else 0 end) as h0330,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1900 and date_format(S.inserted_at, '%H%i') < 1930)
             then S.unit
               else 0 end) as h0400,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 1930 and date_format(S.inserted_at, '%H%i') < 2000)
             then S.unit
               else 0 end) as h0430,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 2000 and date_format(S.inserted_at, '%H%i') < 2030)
             then S.unit
               else 0 end) as h0500,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 2030 and date_format(S.inserted_at, '%H%i') < 2100)
             then S.unit
               else 0 end) as h0530,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 2100 and date_format(S.inserted_at, '%H%i') < 2130)
             then S.unit
               else 0 end) as h0600,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 2130 and date_format(S.inserted_at, '%H%i') < 2200)
             then S.unit
               else 0 end) as h0630,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 2200 and date_format(S.inserted_at, '%H%i') < 2230)
             then S.unit
               else 0 end) as h0700,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 2230 and date_format(S.inserted_at, '%H%i') < 2300)
             then S.unit
               else 0 end) as h0730,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 2300 and date_format(S.inserted_at, '%H%i') < 2330)
             then S.unit
               else 0 end) as h0800,
           sum(case when (date_format(S.inserted_at, '%H%i') >= 2330 and date_format(S.inserted_at, '%H%i') < 2400)
             then S.unit
               else 0 end) as h0830
       from sales S
      inner join items I
         on I.id = S.item_id
      where I.id = ?
       """

      Ecto.Adapters.SQL.query(Repo, query, [item_id])

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
