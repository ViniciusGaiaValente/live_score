# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_score,
  ecto_repos: [LiveScore.Repo]

# Configures the endpoint
config :live_score, LiveScoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B1cXamRdbbDCbpgeXbYFz24vo0HD/wKPmZ9T6buFrsI8WyaVlSxWCYOoaXnQtC6i",
  render_errors: [view: LiveScoreWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveScore.PubSub,
  live_view: [signing_salt: "CYWMYeVm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
