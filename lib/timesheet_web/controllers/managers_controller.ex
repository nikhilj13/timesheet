defmodule TimesheetWeb.ManagersController do
  use TimesheetWeb, :controller

  alias Timesheet.Manager
  alias Timesheet.Manager.Managers

  def index(conn, _params) do
    manager = Manager.list_manager()
    render(conn, "index.html", manager: manager)
  end

  def new(conn, _params) do
    changeset = Manager.change_managers(%Managers{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"managers" => managers_params}) do
    case Manager.create_managers(managers_params) do
      {:ok, managers} ->
        conn
        |> put_flash(:info, "Managers created successfully.")
        |> redirect(to: Routes.managers_path(conn, :show, managers))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    managers = Manager.get_managers!(id)
    render(conn, "show.html", managers: managers)
  end

  def edit(conn, %{"id" => id}) do
    managers = Manager.get_managers!(id)
    changeset = Manager.change_managers(managers)
    render(conn, "edit.html", managers: managers, changeset: changeset)
  end

  def update(conn, %{"id" => id, "managers" => managers_params}) do
    managers = Manager.get_managers!(id)

    case Manager.update_managers(managers, managers_params) do
      {:ok, managers} ->
        conn
        |> put_flash(:info, "Managers updated successfully.")
        |> redirect(to: Routes.managers_path(conn, :show, managers))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", managers: managers, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    managers = Manager.get_managers!(id)
    {:ok, _managers} = Manager.delete_managers(managers)

    conn
    |> put_flash(:info, "Managers deleted successfully.")
    |> redirect(to: Routes.managers_path(conn, :index))
  end
end
