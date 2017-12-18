defmodule BlowCasher.Casher.Group do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlowCasher.Casher.Group


  schema "groups" do
    field :crypto_id, :string
    field :group_name, :string
    field :delete_flg, :integer

    timestamps()
  end

  @doc false
  def changeset(%Group{} = group, attrs) do
    group
    |> cast(attrs, [:crypto_id, :group_name, :delete_flg])
    |> validate_required([:crypto_id, :group_name, :delete_flg])
  end
end
