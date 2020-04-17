defmodule ParamSample.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :group_name, :string

      timestamps()
    end

  end
end
