defmodule Onemorebot.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    Logger.info "Starting supervisor tree..."
    import Supervisor.Spec, warn: false

    slack_token = Application.get_env(:onemorebot, Onemorebot.SlackRtm)[:token]

    children = [
      worker(Slack.Bot, [Onemorebot.SlackRtm, [], slack_token]),
      Plug.Adapters.Cowboy.child_spec(:http, Onemorebot.Router, [],
        [port: 4000])
     ]

    opts = [strategy: :one_for_one, name: Onemorebot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
