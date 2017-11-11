defmodule BlowCasher.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :item_name, :string, null: false
      add :group_id, references(:groups, on_delete: :nothing)

      timestamps()
    end

    create index(:items, [:group_id])
  end
end
