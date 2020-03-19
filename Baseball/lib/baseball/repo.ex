defmodule Baseball.Repo do
  use Ecto.Repo,
    otp_app: :baseball,
    adapter: Ecto.Adapters.MyXQL
end
