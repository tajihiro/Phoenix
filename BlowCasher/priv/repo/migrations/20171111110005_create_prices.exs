defmodule BlowCasher.Repo.Migrations.CreatePrices do
  use Ecto.Migration

  def change do
    create table(:prices) do
      add :price, :decimal, null: false, default: 0
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:prices, [:item_id])
  end
end
