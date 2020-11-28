import Config

config :text_server,
  port: 9999

config :text_server, TextServer.Repo,
  username: "postgres",
  password: "",
  database: "text_server_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
