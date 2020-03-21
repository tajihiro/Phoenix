defmodule Sample.Account.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :passwd, :string
#    field :prefecture_id, :id

    belongs_to :prefecture, Sample.Account.Prefecture

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:last_name, :first_name, :email, :passwd, :prefecture_id])
    |> validate_required([:last_name, :first_name, :email, :passwd])
  end
end
