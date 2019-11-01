defmodule TimesheetWeb.TimesheetdbControllerTest do
  use TimesheetWeb.ConnCase

  alias Timesheet.Timesheetdbs

  @create_attrs %{date: ~D[2010-04-17], hours1: 120.5, hours2: 120.5, hours3: 120.5, hours4: 120.5, hours5: 120.5, hours6: 120.5, hours7: 120.5, hours8: 120.5, job_id1: "some job_id1", job_id2: "some job_id2", job_id3: "some job_id3", job_id4: "some job_id4", job_id5: "some job_id5", job_id6: "some job_id6", job_id7: "some job_id7", job_id8: "some job_id8"}
  @update_attrs %{date: ~D[2011-05-18], hours1: 456.7, hours2: 456.7, hours3: 456.7, hours4: 456.7, hours5: 456.7, hours6: 456.7, hours7: 456.7, hours8: 456.7, job_id1: "some updated job_id1", job_id2: "some updated job_id2", job_id3: "some updated job_id3", job_id4: "some updated job_id4", job_id5: "some updated job_id5", job_id6: "some updated job_id6", job_id7: "some updated job_id7", job_id8: "some updated job_id8"}
  @invalid_attrs %{date: nil, hours1: nil, hours2: nil, hours3: nil, hours4: nil, hours5: nil, hours6: nil, hours7: nil, hours8: nil, job_id1: nil, job_id2: nil, job_id3: nil, job_id4: nil, job_id5: nil, job_id6: nil, job_id7: nil, job_id8: nil}

  def fixture(:timesheetdb) do
    {:ok, timesheetdb} = Timesheetdbs.create_timesheetdb(@create_attrs)
    timesheetdb
  end

  describe "index" do
    test "lists all timesheetdbs", %{conn: conn} do
      conn = get(conn, Routes.timesheetdb_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Timesheetdbs"
    end
  end

  describe "new timesheetdb" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.timesheetdb_path(conn, :new))
      assert html_response(conn, 200) =~ "New Timesheetdb"
    end
  end

  describe "create timesheetdb" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.timesheetdb_path(conn, :create), timesheetdb: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.timesheetdb_path(conn, :show, id)

      conn = get(conn, Routes.timesheetdb_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Timesheetdb"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.timesheetdb_path(conn, :create), timesheetdb: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Timesheetdb"
    end
  end

  describe "edit timesheetdb" do
    setup [:create_timesheetdb]

    test "renders form for editing chosen timesheetdb", %{conn: conn, timesheetdb: timesheetdb} do
      conn = get(conn, Routes.timesheetdb_path(conn, :edit, timesheetdb))
      assert html_response(conn, 200) =~ "Edit Timesheetdb"
    end
  end

  describe "update timesheetdb" do
    setup [:create_timesheetdb]

    test "redirects when data is valid", %{conn: conn, timesheetdb: timesheetdb} do
      conn = put(conn, Routes.timesheetdb_path(conn, :update, timesheetdb), timesheetdb: @update_attrs)
      assert redirected_to(conn) == Routes.timesheetdb_path(conn, :show, timesheetdb)

      conn = get(conn, Routes.timesheetdb_path(conn, :show, timesheetdb))
      assert html_response(conn, 200) =~ "some updated job_id1"
    end

    test "renders errors when data is invalid", %{conn: conn, timesheetdb: timesheetdb} do
      conn = put(conn, Routes.timesheetdb_path(conn, :update, timesheetdb), timesheetdb: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Timesheetdb"
    end
  end

  describe "delete timesheetdb" do
    setup [:create_timesheetdb]

    test "deletes chosen timesheetdb", %{conn: conn, timesheetdb: timesheetdb} do
      conn = delete(conn, Routes.timesheetdb_path(conn, :delete, timesheetdb))
      assert redirected_to(conn) == Routes.timesheetdb_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.timesheetdb_path(conn, :show, timesheetdb))
      end
    end
  end

  defp create_timesheetdb(_) do
    timesheetdb = fixture(:timesheetdb)
    {:ok, timesheetdb: timesheetdb}
  end
end
