defmodule TextServer.Callbacks.LoadThemes do
  import TextServer.JsonResponse

  require Logger
  alias TextServer.Schemas.Theme

  def call(conn) do
    result =
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
    %{title: item["title"], text: item["text"]}
  end
end
