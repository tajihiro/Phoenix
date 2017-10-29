defmodule PhoenixSample.Member do
  use PhoenixSample.Web, :model

  schema "members" do
    field :last_name, :string
    field :first_name, :string
    field :email, :string
    field :birthday, Ecto.DateTime
    field :age, :integer
    belongs_to :team, PhoenixSample.Team

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:last_name, :first_name, :email, :birthday, :age, :team_id])
    |> validate_required([:last_name, :first_name, :email, :birthday])
    |> validate_length(:email, max: 60)
    |> validate_format(:email, ~r/@/)
  end
end
