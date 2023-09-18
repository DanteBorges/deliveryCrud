defmodule DeliveryCrudWeb.OrderController do
  use DeliveryCrudWeb, :controller

  alias DeliveryCrud.Order
  alias DeliveryCrudWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- DeliveryCrud.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Order{} = order} <- DeliveryCrud.get_order_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("order.json", order: order)
    end
  end

  def update(conn, params) do
    with {:ok, %Order{} = order} <- DeliveryCrud.update_order(params) do
      conn
      |> put_status(:ok)
      |> render("order.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Order{}} <- DeliveryCrud.delete_order(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
