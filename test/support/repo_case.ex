defmodule TextServer.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias TextServer.Repo

      import Ecto
      import Ecto.Query
      import TextServer.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TextServer.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(TextServer.Repo, {:shared, self()})
    end

    :ok
  end
end
