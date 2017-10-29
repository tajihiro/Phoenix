defmodule PhoenixSample.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhoenixSample.Member


  schema "members" do
    field :first_name, :string
    field :last_name, :string
    field :passwd, :string
    field :age, :integer
    
    timestamps()
  end

  @doc false
  def changeset(%Member{} = member, attrs) do
    member
    |> cast(attrs, [:last_name, :first_name, :passwd, :age])
    |> validate_required([:last_name, :first_name, :passwd, :age])
  end
end
