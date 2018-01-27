defmodule BlowCasher.Casher.Sales do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlowCasher.Casher.Sales


  schema "sales" do
    field :amount, :decimal
    field :memo, :string
    field :price, :decimal
    field :unit, :integer
    field :item_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Sales{} = sales, attrs) do
    sales
    |> cast(attrs, [:price, :unit, :amount, :memo, :item_id])
    |> validate_required([:price, :unit, :amount, :memo, :item_id])
  end
end
