defmodule Timesheet.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :password_hash, :string, default: "", null: false

      timestamps()
    end

  end
end
