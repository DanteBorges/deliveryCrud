defmodule DeliveryCrud.Users.Create do
  alias DeliveryCrud.Error
  alias DeliveryCrud.Repo
  alias DeliveryCrud.User

  def call(params) do
    cep = Map.get(params, "cep")
    changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, _cep_info} <- client().get_cep_info(cep),
         {:ok, %User{} = user} <- Repo.insert(changeset) do
      {:ok, user}
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> Error.build(:bad_request, result)
    end
  end

  defp client do
    :deliveryCrud
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:via_cep_adapter)
  end
end
