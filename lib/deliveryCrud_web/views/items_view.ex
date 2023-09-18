defmodule DeliveryCrudWeb.ItemView do
  use DeliveryCrudWeb, :view

  alias DeliveryCrud.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created",
      item: item
    }
  end

  def render("item.json", %{item: %Item{} = item}) do
    %{
      item: item
    }
  end
end
