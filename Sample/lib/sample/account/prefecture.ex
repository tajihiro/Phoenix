defmodule Sample.Account.Prefecture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "prefectures" do
    field :prefecture_name, :string

    has_many :members, Sample.Account.Member

    timestamps()
  end

  @doc false
  def changeset(prefecture, attrs) do
    prefecture
    |> cast(attrs, [:prefecture_name])
    |> validate_required([:prefecture_name])
  end
end
