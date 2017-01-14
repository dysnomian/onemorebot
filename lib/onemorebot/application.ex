defmodule ConfigError do
  defexception message: "The CC_SLACK_TOKEN env variable isn't set."
end

defmodule Onemorebot.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    Logger.info "Starting supervisor tree..."
    import Supervisor.Spec, warn: false

    children = [
      worker(Slack.Bot, [Onemorebot.SlackRtm, [], token()]),
      Plug.Adapters.Cowboy.child_spec(:http, Onemorebot.Router, [],
        [port: 4000])
     ]

    opts = [strategy: :one_for_one, name: Onemorebot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp token do
    t = Application.get_env(:onemorebot, :token)
    if t == "" do
      raise ConfigError
      nil
    else
      Logger.info "Slack token set: #{t}"
      t
    end
  end
end
