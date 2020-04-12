defmodule ParamSample.Repo.Migrations.ModifyGameInsertedAt do
  use Ecto.Migration

  def change do
    alter table(:games) do
      modify(:inserted_at, :timestanp, default: fragment("NOW()"))
      modify(:updated_at, :timestanp, default: fragment("NOW()"))
    end

  end
end
