import Config

config :text_server, ecto_repos: [TextServer.Repo]

import_config "#{config_env()}.exs"
