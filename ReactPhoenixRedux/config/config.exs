# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :react_phoenix_redux,
  ecto_repos: [ReactPhoenixRedux.Repo]

# Configures the endpoint
config :react_phoenix_redux, ReactPhoenixReduxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "A9B6OfzygogBNuXqG/TDCu2jV03zviQj2E5BOcxFF/P/T9R/cjtz9hZc8JM7RfJN",
  render_errors: [view: ReactPhoenixReduxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ReactPhoenixRedux.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
