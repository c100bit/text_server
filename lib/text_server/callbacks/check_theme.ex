defmodule TextServer.Callbacks.CheckTheme do
  import TextServer.JsonResponse

  require Logger
  alias TextServer.Schemas.Theme

  def call(conn) do
    result =
      conn.body_params
      |> validate_params!
      |> check_text

    render_success(conn, result)
  rescue
    e in Errors.InvalidParams ->
      render_error(conn, e.message)
  end

  defp validate_params!(params) do
    if Utils.blank?(params["title"]) || Utils.blank?(params["text"]) do
      raise Errors.InvalidParams
    end

    params
  end

  defp check_text(%{"title" => title, "text" => text}) do
    themes = Theme.fetch_all() |> Enum.map(fn t -> check_theme(title, text, t) end)

    if length(themes) == 0 do
      0
    else
      Enum.max(themes)
    end
  end

  defp check_theme(title, text, theme) do
    title = TheFuzz.Similarity.Jaccard.compare(title, theme.title)
    text = TheFuzz.Similarity.Jaccard.compare(text, theme.text)
    Enum.max([title, text])
  end
end
