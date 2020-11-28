defmodule TextServer.JsonResponse do
  require Logger

  import Jason, only: [encode!: 1]
  import Plug.Conn

  @success_encode_error "Success response encode error"

  def render_success(conn, result) do
    conn |> render(success_response(result))
  rescue
    e in Jason.EncodeError ->
      Logger.error("Error while encoding success response: " <> e.message)
      render_error(conn, @success_encode_error)
  end

  def render_error(conn, error) do
    conn |> render(error_response(error))
  end

  defp success_response(result) do
    encode!(%{status: "ok", result: result})
  end

  defp error_response(error) do
    Logger.error("Error response with error: " <> error)
    encode!(%{status: "error", error: error})
  end

  defp render(conn, response) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, response)
    |> halt()
  end
end
