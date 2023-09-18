defmodule DeliveryCrud do
  alias DeliveryCrud.Items.Create, as: ItemCreate


  alias DeliveryCrud.Users.Create, as: UserCreate
  alias DeliveryCrud.Users.Delete, as: UserDelete
  alias DeliveryCrud.Users.Get, as: UserGet
  alias DeliveryCrud.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call

  defdelegate create_item(params), to: ItemCreate, as: :call
end
DeliveryCrud.create_user()
