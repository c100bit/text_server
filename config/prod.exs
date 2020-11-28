import Config

config :text_server,
  port: String.to_integer(System.get_env("PORT") || "80")

config :text_server, TextServer.Repo, url: System.get_env("DATABASE_URL")
