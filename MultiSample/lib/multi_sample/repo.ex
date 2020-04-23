defmodule MultiSample.Repo do
  use Ecto.Repo,
    otp_app: :multi_sample,
    adapter: Ecto.Adapters.MyXQL
end
