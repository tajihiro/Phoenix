defmodule PhoenixSample.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :last_name, :string
      add :first_name, :string
      add :passwd, :string
      add :age, :integer

      timestamps()
    end

  end
end
