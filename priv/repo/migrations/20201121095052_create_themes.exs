defmodule TextServer.Repo.Migrations.CreateThemes do
  use Ecto.Migration

  def change do
    create table(:themes) do
      add :title, :string, null: false
      add :text, :text, null: false
    end

  end
end
