defmodule DeliveryCrud.Repo.Migrations.CreateOrdersTable do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :address, :string
      add :comments, :string
      add :payment_method, :payment_type
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
