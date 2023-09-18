defmodule DeliveryCrudWeb.ItemController do
  use DeliveryCrudWeb, :controller

  alias DeliveryCrud.Item
  alias DeliveryCrudWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- DeliveryCrud.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Item{} = item} <- DeliveryCrud.get_item_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("item.json", item: item)
    end
  end

  def update(conn, params) do
    with {:ok, %Item{} = item} <- DeliveryCrud.update_item(params) do
      conn
      |> put_status(:ok)
      |> render("item.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Item{}} <- DeliveryCrud.delete_item(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
