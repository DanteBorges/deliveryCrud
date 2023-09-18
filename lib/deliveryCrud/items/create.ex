defmodule DeliveryCrud.Items.Create do
  alias DeliveryCrud.Error
  alias DeliveryCrud.Item
  alias DeliveryCrud.Repo

  def call(params) do
    params
    |> Item.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Item{}} = result), do: result

  defp handle_insert({:error, result}) do
    Error.build(:bad_request, result)
  end
end
