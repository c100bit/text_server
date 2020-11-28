defmodule Utils do
  def blank?(s), do: s == nil || String.length(String.trim(s)) == 0

  def settings(module, field) do
    Application.fetch_env!(:text_server, module)[field]
  end
end
