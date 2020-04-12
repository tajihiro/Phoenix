defmodule ParamSample.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :member_name, :string

      timestamps()
    end

  end
end
