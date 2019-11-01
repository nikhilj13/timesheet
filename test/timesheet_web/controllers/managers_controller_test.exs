defmodule TimesheetWeb.ManagersControllerTest do
  use TimesheetWeb.ConnCase

  alias Timesheet.Manager

  @create_attrs %{email: "some email", name: "some name", password: "some password"}
  @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password"}
  @invalid_attrs %{email: nil, name: nil, password: nil}

  def fixture(:managers) do
    {:ok, managers} = Manager.create_managers(@create_attrs)
    managers
  end

  describe "index" do
    test "lists all manager", %{conn: conn} do
      conn = get(conn, Routes.managers_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Manager"
    end
  end

  describe "new managers" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.managers_path(conn, :new))
      assert html_response(conn, 200) =~ "New Managers"
    end
  end

  describe "create managers" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.managers_path(conn, :create), managers: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.managers_path(conn, :show, id)

      conn = get(conn, Routes.managers_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Managers"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.managers_path(conn, :create), managers: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Managers"
    end
  end

  describe "edit managers" do
    setup [:create_managers]

    test "renders form for editing chosen managers", %{conn: conn, managers: managers} do
      conn = get(conn, Routes.managers_path(conn, :edit, managers))
      assert html_response(conn, 200) =~ "Edit Managers"
    end
  end

  describe "update managers" do
    setup [:create_managers]

    test "redirects when data is valid", %{conn: conn, managers: managers} do
      conn = put(conn, Routes.managers_path(conn, :update, managers), managers: @update_attrs)
      assert redirected_to(conn) == Routes.managers_path(conn, :show, managers)

      conn = get(conn, Routes.managers_path(conn, :show, managers))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, managers: managers} do
      conn = put(conn, Routes.managers_path(conn, :update, managers), managers: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Managers"
    end
  end

  describe "delete managers" do
    setup [:create_managers]

    test "deletes chosen managers", %{conn: conn, managers: managers} do
      conn = delete(conn, Routes.managers_path(conn, :delete, managers))
      assert redirected_to(conn) == Routes.managers_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.managers_path(conn, :show, managers))
      end
    end
  end

  defp create_managers(_) do
    managers = fixture(:managers)
    {:ok, managers: managers}
  end
end
