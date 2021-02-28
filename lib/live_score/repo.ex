defmodule LiveScore.Repo do
  use Ecto.Repo,
    otp_app: :live_score,
    adapter: Ecto.Adapters.Postgres
end
