defmodule TimesheetWeb.PageController do
  use TimesheetWeb, :controller

  def index(conn, _params) do
    conn |> redirect(to: Routes.session_path(conn, :new))
  end
end
