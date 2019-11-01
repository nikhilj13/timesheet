defmodule Timesheet.Repo.Migrations.CreateTimesheetdbs do
  use Ecto.Migration

  def change do
    create table(:timesheetdbs) do
      add :job_id1, :string
      add :job_id2, :string
      add :job_id3, :string
      add :job_id4, :string
      add :job_id5, :string
      add :job_id6, :string
      add :job_id7, :string
      add :job_id8, :string
      add :hours1, :float
      add :hours2, :float
      add :hours3, :float
      add :hours4, :float
      add :hours5, :float
      add :hours6, :float
      add :hours7, :float
      add :hours8, :float
      add :date, :date

      timestamps()
    end

  end
end
