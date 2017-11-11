defmodule BlowCasher.Repo.Migrations.CreateSales do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add :price, :decimal, null: false, default: 0
      add :unit, :integer, null: false, default: 0
      add :amount, :decimal, null: false, default: 0
      add :memo, :text
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:sales, [:item_id])
  end
end
