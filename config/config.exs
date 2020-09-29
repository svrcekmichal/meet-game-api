# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :meet_game,
  ecto_repos: [MeetGame.Repo]

# Configures the endpoint
config :meet_game, MeetGameWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VD+thasVDmGm5NhJx29525alJqpp0XixOXCg87TjtMSm+FaJm73y2Wug2qZAEErH",
  render_errors: [view: MeetGameWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MeetGame.PubSub,
  live_view: [signing_salt: "hadcWsHZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
