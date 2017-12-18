defmodule BlowCasher.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :crypto_id, :string, size: 20, null: false
      add :group_name, :string, size: 60, null: false
      add :delete_flg, :integer, size: 1, null: false, default: 0

      timestamps()
    end

  end
end
