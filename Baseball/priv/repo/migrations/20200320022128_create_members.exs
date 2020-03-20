defmodule Baseball.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :last_name, :string
      add :first_name, :string
      add :email, :string
      add :password_digest, :string
      add :prefecture_id, references(:prefectures, on_delete: :nothing)

      timestamps()
    end

    create index(:members, [:prefecture_id])
  end
end
