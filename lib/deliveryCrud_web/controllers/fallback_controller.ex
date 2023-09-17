defmodule DeliveryCrudWeb.FallbackController do
  use DeliveryCrudWeb, :controller

  alias DeliveryCrud.Error
  alias DeliveryCrudWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}} = _error) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
