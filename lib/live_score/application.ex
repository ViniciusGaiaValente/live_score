defmodule LiveScore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiveScore.Repo,
      # Start the Telemetry supervisor
      LiveScoreWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveScore.PubSub},
      # Start the Endpoint (http/https)
      LiveScoreWeb.Endpoint
      # Start a worker by calling: LiveScore.Worker.start_link(arg)
      # {LiveScore.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveScore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiveScoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
