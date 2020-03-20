defmodule Baseball.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :team_name, :string
      add :prefecture_id, references(:prefectures, on_delete: :nothing)

      timestamps()
    end

    create index(:teams, [:prefecture_id])
  end
end
