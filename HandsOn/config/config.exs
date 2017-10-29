# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :hands_on, HandsOnWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "J8I3JtXew9HbzvZkiedHbxe5nQw7ZmcMLU5k9wZilBT8lZsKFQtUslfj9e8LdN9z",
  render_errors: [view: HandsOnWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HandsOn.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
