defmodule TimesheetWeb.PageController do
  use TimesheetWeb, :controller

  def index(conn, _params) do

    user_id = get_session(conn, :user_id)
    if user_id do
      user_type = get_session(conn, :type)
      if user_type === "worker" do
        conn |> redirect(to: Routes.user_path(conn, :show, %{"id" => user_id}))
      else
        conn |> redirect(to: Routes.managers_path(conn, :show, %{"id" => user_id}))
      end
    else
      conn |> redirect(to: Routes.session_path(conn, :new))
    end
  end
end
