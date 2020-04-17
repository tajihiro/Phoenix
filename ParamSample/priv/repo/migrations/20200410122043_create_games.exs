defmodule ParamSample.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :member_id, :string
      add :goal, :integer
      add :assist, :integer
      add :mvp_flg, :integer
      add :group_id, :id

      timestamps()
    end

  end
end
