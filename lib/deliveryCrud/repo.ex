defmodule DeliveryCrud.Repo do
  use Ecto.Repo,
    otp_app: :deliveryCrud,
    adapter: Ecto.Adapters.Postgres
end
