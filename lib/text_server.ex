defmodule TextServer do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      TextServer.Repo,
      {Plug.Cowboy, scheme: :http, plug: TextServer.Router, options: [port: app_port()]}
    ]

    Logger.info("Started application #{__MODULE__} at port: #{app_port()}")

    Supervisor.start_link(children, strategy: :one_for_one, name: TextServer.Supervisor)
  end

  defp app_port(), do: Application.fetch_env!(:text_server, :port)
end
