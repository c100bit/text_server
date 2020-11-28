defmodule TextServer.Schemas.Theme do
  use Ecto.Schema

  require Logger
  require Ecto.Query

  alias TextServer.Repo

  schema "themes" do
    field(:title, :string)
    field(:text, :string)
  end

  def fetch_all do
    __MODULE__ |> Repo.all()
  end

  def create_themes(themes) do
    Repo.insert_all(__MODULE__, themes)
  end
end
