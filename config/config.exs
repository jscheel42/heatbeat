# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :heatbeat, Heatbeat.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "UQjiL+yHHO3+tTPNOODJPBT8CGWVsvWCHkSyKA4KWXKzmG5hHYm8edgJJlxsqT5E",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Heatbeat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :heatbeat, ecto_repos: [Heatbeat.Repo]

config :mix_docker, image: "jscheel42/heatbeat"

config :scrivener_html,
  routes_helper: Heatbeat.Router.Helpers
