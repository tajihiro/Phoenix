defmodule PhoenixSample.Repo.Migrations.CreateTeam do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :team_name, :string, size: 20, null: false

      timestamps()
    end

  end
end
