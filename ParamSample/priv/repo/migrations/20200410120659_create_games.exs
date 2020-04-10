defmodule ParamSample.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :member_id, :integer
      add :goal, :integer
      add :assist, :integer
      add :mvp_flg, :integer

      timestamps()
    end

  end
end
