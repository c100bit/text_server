defmodule TextServer.Router do
  use Plug.Router
  use Plug.ErrorHandler

  import TextServer.JsonResponse

  require Logger

  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:json],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  # params = %{ title: "title", text: "text" }
  post("/check_theme", do: TextServer.Callbacks.CheckTheme.call(conn))

  # params = %{ themes: [{"title1", text: "text1"}, {"title2", text: "text2"}] }
  post("/load_themes", do: TextServer.Callbacks.LoadThemes.call(conn))

  match(_, do: render_error(conn, "Not found"))

  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}),
    do: render_error(conn, "Server error")
end
