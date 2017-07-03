defmodule PhoenixSample.Team do
  use PhoenixSample.Web, :model

  schema "teams" do
    field :team_name, :string

    has_many :members, PhoenixSample.Member

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:team_name])
    |> validate_required([:team_name])
  end
end
