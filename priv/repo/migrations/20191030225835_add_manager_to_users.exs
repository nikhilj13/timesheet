defmodule Timesheet.Repo.Migrations.AddManagerToUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :manager_id, references(:manager)
    end
  end
end
