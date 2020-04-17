defmodule ParamSample.Sample.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :assist, :integer
    field :goal, :integer
    field :member_id, :string
    field :mvp_flg, :integer
    field :group_id, :id

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:member_id, :goal, :assist, :mvp_flg])
    |> validate_required([:member_id, :goal, :assist, :mvp_flg])
  end
end
