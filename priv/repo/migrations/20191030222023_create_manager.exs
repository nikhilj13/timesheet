defmodule Timesheet.Repo.Migrations.CreateManager do
  use Ecto.Migration

  def change do
    create table(:manager) do
      add :email, :string
      add :name, :string
      add :password, :string
      add :password_hash, :string, default: "", null: false

      timestamps()
    end
  end
end
