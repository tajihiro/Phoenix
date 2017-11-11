defmodule BlowCasher.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :group_id, :string, size: 20, null: false
      add :delete_flg, :integer, size: 1, null: false

      timestamps()
    end

  end
end
