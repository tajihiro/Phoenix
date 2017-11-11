# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blow_casher,
  ecto_repos: [BlowCasher.Repo]

# Configures the endpoint
config :blow_casher, BlowCasherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xeL/62eWvH7r+WGipJTWhQxWLj3l2j1XbZetce4oJn1P+FA+PKPIfvjklZzv8W5B",
  render_errors: [view: BlowCasherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BlowCasher.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
