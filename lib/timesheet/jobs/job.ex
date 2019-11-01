defmodule Timesheet.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :budget, :integer
    field :description, :string
    field :job_code, :string
    field :name, :string

    timestamps()

    belongs_to :manager, Timesheet.Manager.Managers
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:job_code, :budget, :name, :description, :manager_id])
    |> validate_required([:job_code, :budget, :name, :description, :manager_id])
  end
end
