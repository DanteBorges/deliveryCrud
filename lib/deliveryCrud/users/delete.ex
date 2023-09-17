defmodule DeliveryCrudWeb.Items.Delete do
  alias DeliveryCrudWeb.Error
  alias DeliveryCrudWeb.Item
  alias DeliveryCrudWeb.Repo

  def call(id) do
    case Repo.get(Item, id) do
      nil -> Error.build(:not_found, "Item not found")
      item -> Repo.delete(item)
    end
  end
end
