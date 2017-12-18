# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phenix_sample, PhenixSampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V4kGid/2SfWVte9sEREnwDpedwCYmuU7n83Hg8r94v5mP9Vm4V2iX+sQI862TboG",
  render_errors: [view: PhenixSampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhenixSample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
