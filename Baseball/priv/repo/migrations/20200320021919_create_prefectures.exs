defmodule Baseball.Repo.Migrations.CreatePrefectures do
  use Ecto.Migration

  def change do
    create table(:prefectures) do
      add :prefecture_name, :string

      timestamps()
    end

  end
end
