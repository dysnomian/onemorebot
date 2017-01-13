defmodule Onemorebot.Router do
  use Plug.Router
  plug Plug.Parsers, parsers: [:urlencoded]
  plug :match
  plug :dispatch

  # Slack will periodically send get requests
  # to make sure the bot is still alive.
  get "/" do
    send_resp(conn, 200, "")
  end

  post "/" do
    IO.inspect conn
    %{"text" => text} = conn.params
    send_resp(conn, 200, text)
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
