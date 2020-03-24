defmodule Sample.Repo.Migrations.AddSexToMembers do
  use Ecto.Migration

  def change do
    alter table(:members) do
      add :sex, :integer
    end
  end
end
