defmodule ReactPhoenixRedux.Repo do
  use Ecto.Repo,
    otp_app: :react_phoenix_redux,
    adapter: Ecto.Adapters.MyXQL
end
