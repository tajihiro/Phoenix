# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :db_connect,
  ecto_repos: [DbConnect.Repo]

# Configures the endpoint
config :db_connect, DbConnectWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zCWwlu801p9CCnrTm6YNoKQlKVOJHVeMVjgqpvbE+CqQzjgYZBf/Bg8DLCBg0vAj",
  render_errors: [view: DbConnectWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DbConnect.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
