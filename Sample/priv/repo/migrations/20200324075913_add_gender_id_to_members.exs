defmodule Sample.Repo.Migrations.AddSexToMembers do
  use Ecto.Migration

  def change do
    alter table(:members) do
      add :gender_id, :integer
    end
  end
end
