defmodule ParamSample.Repo do
  use Ecto.Repo,
    otp_app: :param_sample,
    adapter: Ecto.Adapters.MyXQL
end
