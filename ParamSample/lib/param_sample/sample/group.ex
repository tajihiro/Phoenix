defmodule ParamSample.Sample.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :group_name, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:group_name])
    |> validate_required([:group_name])
  end
end
