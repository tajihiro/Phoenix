use Mix.Config

# Configure your database
config :param_sample, ParamSample.Repo,
  username: "root",
  password: "",
  database: "param_sample_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :param_sample, ParamSampleWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
