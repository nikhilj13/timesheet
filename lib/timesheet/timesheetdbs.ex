defmodule Timesheet.Timesheetdbs do
  @moduledoc """
  The Timesheetdbs context.
  """

  import Ecto.Query, warn: false
  alias Timesheet.Repo

  alias Timesheet.Timesheetdbs.Timesheetdb

  @doc """
  Returns the list of timesheetdbs.

  ## Examples

      iex> list_timesheetdbs()
      [%Timesheetdb{}, ...]

  """
  def list_timesheetdbs do
    Repo.all(Timesheetdb)
    |> Repo.preload([:users])
  end

  @doc """
  Gets a single timesheetdb.

  Raises `Ecto.NoResultsError` if the Timesheetdb does not exist.

  ## Examples

      iex> get_timesheetdb!(123)
      %Timesheetdb{}

      iex> get_timesheetdb!(456)
      ** (Ecto.NoResultsError)

  """
  def get_timesheetdb!(id), do: Repo.get!(Timesheetdb, id)

  @doc """
  Creates a timesheetdb.

  ## Examples

      iex> create_timesheetdb(%{field: value})
      {:ok, %Timesheetdb{}}

      iex> create_timesheetdb(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_timesheetdb(attrs \\ %{}) do
    %Timesheetdb{}
    |> Timesheetdb.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a timesheetdb.

  ## Examples

      iex> update_timesheetdb(timesheetdb, %{field: new_value})
      {:ok, %Timesheetdb{}}

      iex> update_timesheetdb(timesheetdb, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_timesheetdb(%Timesheetdb{} = timesheetdb, attrs) do
    timesheetdb
    |> Timesheetdb.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Timesheetdb.

  ## Examples

      iex> delete_timesheetdb(timesheetdb)
      {:ok, %Timesheetdb{}}

      iex> delete_timesheetdb(timesheetdb)
      {:error, %Ecto.Changeset{}}

  """
  def delete_timesheetdb(%Timesheetdb{} = timesheetdb) do
    Repo.delete(timesheetdb)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking timesheetdb changes.

  ## Examples

      iex> change_timesheetdb(timesheetdb)
      %Ecto.Changeset{source: %Timesheetdb{}}

  """
  def change_timesheetdb(%Timesheetdb{} = timesheetdb) do
    Timesheetdb.changeset(timesheetdb, %{})
  end
end
