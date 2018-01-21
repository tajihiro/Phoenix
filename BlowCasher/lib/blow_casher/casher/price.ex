defmodule BlowCasher.Casher.Price do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlowCasher.Casher.Price


  schema "prices" do
    field :price, :decimal
    field :item_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Price{} = price, attrs) do
    price
    |> cast(attrs, [:price, :item_id])
    |> validate_required([:price, :item_id])
  end
end
