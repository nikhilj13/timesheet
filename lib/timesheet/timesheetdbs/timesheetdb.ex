defmodule Timesheet.Timesheetdbs.Timesheetdb do
  use Ecto.Schema
  import Ecto.Changeset

  schema "timesheetdbs" do
    field :date, :date
    field :hours1, :float
    field :hours2, :float
    field :hours3, :float
    field :hours4, :float
    field :hours5, :float
    field :hours6, :float
    field :hours7, :float
    field :hours8, :float
    field :job_id1, :string
    field :job_id2, :string
    field :job_id3, :string
    field :job_id4, :string
    field :job_id5, :string
    field :job_id6, :string
    field :job_id7, :string
    field :job_id8, :string

    timestamps()

    belongs_to :worker, Timesheet.Users.User
  end

  @doc false
  def changeset(timesheetdb, attrs) do
    timesheetdb
    |> cast(attrs, [:job_id1, :job_id2, :job_id3, :job_id4, :job_id5, :job_id6, :job_id7, :job_id8, :hours1, :hours2, :hours3, :hours4, :hours5, :hours6, :hours7, :hours8, :date, user_id])
    |> validate_required([:job_id1, :job_id2, :job_id3, :job_id4, :job_id5, :job_id6, :job_id7, :job_id8, :hours1, :hours2, :hours3, :hours4, :hours5, :hours6, :hours7, :hours8, :date, user_id])
  end
end
