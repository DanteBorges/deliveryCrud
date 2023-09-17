defmodule DeliveryCrud do

  alias DeliveryCrud.Users.Create, as: UserCreate
  alias DeliveryCrud.Users.Get, as: UserGet

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call
end
DeliveryCrud.create_user()
