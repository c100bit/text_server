defmodule Errors.ServerError do
  defexception message: "server error"
end

defmodule Errors.InvalidParams do
  defexception message: "Invalid params"
end

defmodule Errors.Db do
  defexception message: "Db error"
end
