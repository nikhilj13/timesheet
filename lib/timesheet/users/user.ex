defmodule Timesheet.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string

    timestamps()

    belongs_to :manager, Timesheet.Manager.Managers

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :password_confirmation, :manager_id])
    |> validate_length(:password, min: 8)
    |> hash_password()
    |> validate_required([:email, :name, :password_hash, :manager_id])
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
