defmodule BlowCasher.Casher.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlowCasher.Casher.Item


  schema "items" do
    field :item_name, :string
    field :group_id, :id
    field :crypto_id, :string
    field :price, :decimal

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:item_name, :group_id, :crypto_id, :price])
    |> validate_required([:item_name, :group_id, :crypto_id, :price])
  end
end
