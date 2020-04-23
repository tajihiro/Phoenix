defmodule MultiSample.Sample.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :member_name, :string

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:member_name])
    |> validate_required([:member_name])
  end
end
