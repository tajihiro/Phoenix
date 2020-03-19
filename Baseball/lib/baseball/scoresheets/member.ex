defmodule Baseball.Scoresheets.Member do
  use Ecto.Schema
  import Ecto.Changeset

  alias Baseball.Scoresheets.Prefecture

  schema "members" do
    field :first_name, :string
    field :last_name, :string

    belongs_to :prefecture, Prefecture

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:last_name, :first_name])
    |> validate_required([:last_name, :first_name])
  end
end
