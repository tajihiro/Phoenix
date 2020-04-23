defmodule MultiSample.Sample.MemberScore do
  use Ecto.Schema
  import Ecto.Changeset

  schema "member_scores" do
    field :assist, :integer
    field :goal, :integer
    field :mvp_flg, :integer
    field :member_id, :id

    timestamps()
  end

  @doc false
  def changeset(member_score, attrs) do
    member_score
    |> cast(attrs, [:goal, :assist, :mvp_flg])
    |> validate_required([:goal, :assist, :mvp_flg])
  end
end
