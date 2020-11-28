import Config

config :text_server,
  port: 8080

config :text_server, TextServer.Repo,
  database: "text_server_prod",
  username: "postgres",
  password: "",
  hostname: "localhost"
