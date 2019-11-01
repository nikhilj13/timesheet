defmodule TimesheetWeb.TimesheetdbController do
  use TimesheetWeb, :controller

  alias Timesheet.Timesheetdbs
  alias Timesheet.Timesheetdbs.Timesheetdb

  def index(conn, _params) do
    timesheetdbs = Timesheetdbs.list_timesheetdbs()
    render(conn, "index.html", timesheetdbs: timesheetdbs)
  end

  def new(conn, _params) do
    changeset = Timesheetdbs.change_timesheetdb(%Timesheetdb{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"timesheetdb" => timesheetdb_params}) do
    case Timesheetdbs.create_timesheetdb(timesheetdb_params) do
      {:ok, timesheetdb} ->
        conn
        |> put_flash(:info, "Timesheetdb created successfully.")
        |> redirect(to: Routes.timesheetdb_path(conn, :show, timesheetdb))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    timesheetdb = Timesheetdbs.get_timesheetdb!(id)
    render(conn, "show.html", timesheetdb: timesheetdb)
  end

  def edit(conn, %{"id" => id}) do
    timesheetdb = Timesheetdbs.get_timesheetdb!(id)
    changeset = Timesheetdbs.change_timesheetdb(timesheetdb)
    render(conn, "edit.html", timesheetdb: timesheetdb, changeset: changeset)
  end

  def update(conn, %{"id" => id, "timesheetdb" => timesheetdb_params}) do
    timesheetdb = Timesheetdbs.get_timesheetdb!(id)

    case Timesheetdbs.update_timesheetdb(timesheetdb, timesheetdb_params) do
      {:ok, timesheetdb} ->
        conn
        |> put_flash(:info, "Timesheetdb updated successfully.")
        |> redirect(to: Routes.timesheetdb_path(conn, :show, timesheetdb))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", timesheetdb: timesheetdb, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    timesheetdb = Timesheetdbs.get_timesheetdb!(id)
    {:ok, _timesheetdb} = Timesheetdbs.delete_timesheetdb(timesheetdb)

    conn
    |> put_flash(:info, "Timesheetdb deleted successfully.")
    |> redirect(to: Routes.timesheetdb_path(conn, :index))
  end
end
