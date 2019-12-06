defmodule ReactPhoenixRedux.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :last_name, :string
      add :first_name, :string
      add :email, :string
      add :passwd, :string

      timestamps()
    end

  end
end
