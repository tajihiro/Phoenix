# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :param_sample,
  ecto_repos: [ParamSample.Repo]

# Configures the endpoint
config :param_sample, ParamSampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RS2xfc7NK4pbg1R7XvHkJE/fYU6MCXCedTr1jArWbacddGb1xyuxI8KVrbl8T6k8",
  render_errors: [view: ParamSampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ParamSample.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "DBig1Fuw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
