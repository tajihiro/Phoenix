defmodule MultiSample.Repo.Migrations.CreateMemberScores do
  use Ecto.Migration

  def change do
    create table(:member_scores) do
      add :goal, :integer
      add :assist, :integer
      add :mvp_flg, :integer
      add :member_id, references(:members, on_delete: :nothing)

      timestamps()
    end

    create index(:member_scores, [:member_id])
  end
end
