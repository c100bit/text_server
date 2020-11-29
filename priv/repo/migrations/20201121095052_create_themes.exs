defmodule TextServer.Repo.Migrations.CreateThemes do
  use Ecto.Migration

  def change do
    create table(:themes) do
      add :external_id, :integer, null: false
      add :title, :string, null: false
      add :text, :text, null: false
    end

  end
end
