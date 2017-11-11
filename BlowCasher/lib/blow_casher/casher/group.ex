defmodule BlowCasher.Casher.Group do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlowCasher.Casher.Group


  schema "groups" do
    field :delete_flg, :integer
    field :group_id, :string

    timestamps()
  end

  @doc false
  def changeset(%Group{} = group, attrs) do
    group
    |> cast(attrs, [:group_id, :delete_flg])
    |> validate_required([:group_id, :delete_flg])
  end
end
