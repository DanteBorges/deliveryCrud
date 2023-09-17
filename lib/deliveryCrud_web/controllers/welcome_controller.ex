defmodule DeliveryCrudWeb.WelcomeController do
  use DeliveryCrudWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Hello World Phoenix Elixir")
  end
end
