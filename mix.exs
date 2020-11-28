defmodule TextServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :text_server,
      version: "0.1.0",
      elixir: "~> 1.11.2",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TextServer, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.8.0"},
      {:plug, "~> 1.11.0"},
      {:plug_cowboy, "~> 2.4.1"},
      {:fcmex, "~> 0.4.1"},
      {:ecto_sql, "~> 3.5"},
      {:jason, "~> 1.2"},
      {:postgrex, "~> 0.15.7"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:mock, "~> 0.3", only: :test},
      {:the_fuzz, "~> 0.5.0"}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
