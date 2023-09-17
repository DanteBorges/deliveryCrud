defmodule DeliveryCrud do

  alias DeliveryCrud.Users.Create, as: UserCreate
  defdelegate create_user(params), to: UserCreate, as: :call

end
DeliveryCrud.create_user()
