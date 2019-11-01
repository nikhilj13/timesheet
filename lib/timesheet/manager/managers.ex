defmodule Timesheet.Manager.Managers do
  use Ecto.Schema
  import Ecto.Changeset

  schema "manager" do
    field :email, :string
    field :name, :string
    field :password_hash, :string

    timestamps()

    has_many :jobs, Timesheet.Jobs.Job

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
  end

  @doc false
  def changeset(managers, attrs) do
    managers
    |> cast(attrs, [:email, :name, :password_confirmation, :job_id])
    |> validate_length(:password, min: 8)
    |> hash_password()
    |> validate_required([:email, :name, :password_hash, :job_id])
  end

  def hash_password(cset) do
    pw = get_change(cset, :password)
    if pw do
      change(cset, Argon2.add_hash(pw))
    else
      cset
    end
  end
end
