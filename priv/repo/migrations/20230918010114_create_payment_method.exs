defmodule DeliveryCrud.Repo.Migrations.CreatePaymentMethodType do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE payment_type AS ENUM ('money', 'credit_card', 'debit_card')"
    down_query = "DROP TYPE payment_type"

    execute(up_query, down_query)
  end
end
