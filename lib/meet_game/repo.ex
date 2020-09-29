defmodule MeetGame.Repo do
  use Ecto.Repo,
    otp_app: :meet_game,
    adapter: Ecto.Adapters.Postgres
end
