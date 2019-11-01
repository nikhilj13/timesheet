defmodule Timesheet.Manager do
  @moduledoc """
  The Manager context.
  """

  import Ecto.Query, warn: false
  alias Timesheet.Repo

  alias Timesheet.Manager.Managers

  @doc """
  Returns the list of manager.

  ## Examples

      iex> list_manager()
      [%Managers{}, ...]

  """
  def list_manager do
    Repo.all(Managers)
  end

  @doc """
  Gets a single managers.

  Raises `Ecto.NoResultsError` if the Managers does not exist.

  ## Examples

      iex> get_managers!(123)
      %Managers{}

      iex> get_managers!(456)
      ** (Ecto.NoResultsError)

  """
  def get_managers!(id), do: Repo.get!(Managers, id)

  @doc """
  Creates a managers.

  ## Examples

      iex> create_managers(%{field: value})
      {:ok, %Managers{}}

      iex> create_managers(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_managers(attrs \\ %{}) do
    %Managers{}
    |> Managers.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a managers.

  ## Examples

      iex> update_managers(managers, %{field: new_value})
      {:ok, %Managers{}}

      iex> update_managers(managers, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_managers(%Managers{} = managers, attrs) do
    managers
    |> Managers.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Managers.

  ## Examples

      iex> delete_managers(managers)
      {:ok, %Managers{}}

      iex> delete_managers(managers)
      {:error, %Ecto.Changeset{}}

  """
  def delete_managers(%Managers{} = managers) do
    Repo.delete(managers)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking managers changes.

  ## Examples

      iex> change_managers(managers)
      %Ecto.Changeset{source: %Managers{}}

  """
  def change_managers(%Managers{} = managers) do
    Managers.changeset(managers, %{})
  end
end
