defmodule PhoenixSample.Repo.Migrations.CreateMember do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :last_name, :string, size: 20, null: false
      add :first_name, :string, size:  20, null: false
      add :email, :string, size:  60
      add :birthday, :datetime
      add :age, :integer
      add :team_id, references(:teams)

      timestamps()
    end

  end
end
