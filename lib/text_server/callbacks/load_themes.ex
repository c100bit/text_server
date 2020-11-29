defmodule TextServer.Callbacks.LoadThemes do
  import TextServer.JsonResponse

  require Logger
  alias TextServer.Schemas.Theme

  def call(conn) do
    conn.body_params
    |> load_themes

    render_success(conn, "success")
  rescue
    e in Errors.InvalidParams ->
      render_error(conn, e.message)
  end

  defp load_themes(%{"themes" => themes}) do
    themes
    |> Enum.map(fn i -> build_row(i) end)
    |> Theme.create_themes()
  end

  defp build_row(item) do
    %{
      external_id: item["id"],
      title: String.downcase(item["title"]),
      text: String.downcase(item["text"])
    }
  end
end
