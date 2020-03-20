defmodule Baseball.Scoresheet.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_digest, :string
    field :prefecture_id, :id

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:last_name, :first_name, :email, :password_digest])
    |> validate_required([:last_name, :first_name, :email, :password_digest])
  end
end
