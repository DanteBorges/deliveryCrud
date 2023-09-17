defmodule DeliveryCrud.Users.Delete do
  alias DeliveryCrud.Error
  alias DeliveryCrud.Repo
  alias DeliveryCrud.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> Error.build_user_not_found_error()
      user -> Repo.delete(user)
    end
  end
end
