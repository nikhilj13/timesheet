defmodule Timesheet.TimesheetdbsTest do
  use Timesheet.DataCase

  alias Timesheet.Timesheetdbs

  describe "timesheetdbs" do
    alias Timesheet.Timesheetdbs.Timesheetdb

    @valid_attrs %{date: ~D[2010-04-17], hours1: 120.5, hours2: 120.5, hours3: 120.5, hours4: 120.5, hours5: 120.5, hours6: 120.5, hours7: 120.5, hours8: 120.5, job_id1: "some job_id1", job_id2: "some job_id2", job_id3: "some job_id3", job_id4: "some job_id4", job_id5: "some job_id5", job_id6: "some job_id6", job_id7: "some job_id7", job_id8: "some job_id8"}
    @update_attrs %{date: ~D[2011-05-18], hours1: 456.7, hours2: 456.7, hours3: 456.7, hours4: 456.7, hours5: 456.7, hours6: 456.7, hours7: 456.7, hours8: 456.7, job_id1: "some updated job_id1", job_id2: "some updated job_id2", job_id3: "some updated job_id3", job_id4: "some updated job_id4", job_id5: "some updated job_id5", job_id6: "some updated job_id6", job_id7: "some updated job_id7", job_id8: "some updated job_id8"}
    @invalid_attrs %{date: nil, hours1: nil, hours2: nil, hours3: nil, hours4: nil, hours5: nil, hours6: nil, hours7: nil, hours8: nil, job_id1: nil, job_id2: nil, job_id3: nil, job_id4: nil, job_id5: nil, job_id6: nil, job_id7: nil, job_id8: nil}

    def timesheetdb_fixture(attrs \\ %{}) do
      {:ok, timesheetdb} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Timesheetdbs.create_timesheetdb()

      timesheetdb
    end

    test "list_timesheetdbs/0 returns all timesheetdbs" do
      timesheetdb = timesheetdb_fixture()
      assert Timesheetdbs.list_timesheetdbs() == [timesheetdb]
    end

    test "get_timesheetdb!/1 returns the timesheetdb with given id" do
      timesheetdb = timesheetdb_fixture()
      assert Timesheetdbs.get_timesheetdb!(timesheetdb.id) == timesheetdb
    end

    test "create_timesheetdb/1 with valid data creates a timesheetdb" do
      assert {:ok, %Timesheetdb{} = timesheetdb} = Timesheetdbs.create_timesheetdb(@valid_attrs)
      assert timesheetdb.date == ~D[2010-04-17]
      assert timesheetdb.hours1 == 120.5
      assert timesheetdb.hours2 == 120.5
      assert timesheetdb.hours3 == 120.5
      assert timesheetdb.hours4 == 120.5
      assert timesheetdb.hours5 == 120.5
      assert timesheetdb.hours6 == 120.5
      assert timesheetdb.hours7 == 120.5
      assert timesheetdb.hours8 == 120.5
      assert timesheetdb.job_id1 == "some job_id1"
      assert timesheetdb.job_id2 == "some job_id2"
      assert timesheetdb.job_id3 == "some job_id3"
      assert timesheetdb.job_id4 == "some job_id4"
      assert timesheetdb.job_id5 == "some job_id5"
      assert timesheetdb.job_id6 == "some job_id6"
      assert timesheetdb.job_id7 == "some job_id7"
      assert timesheetdb.job_id8 == "some job_id8"
    end

    test "create_timesheetdb/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Timesheetdbs.create_timesheetdb(@invalid_attrs)
    end

    test "update_timesheetdb/2 with valid data updates the timesheetdb" do
      timesheetdb = timesheetdb_fixture()
      assert {:ok, %Timesheetdb{} = timesheetdb} = Timesheetdbs.update_timesheetdb(timesheetdb, @update_attrs)
      assert timesheetdb.date == ~D[2011-05-18]
      assert timesheetdb.hours1 == 456.7
      assert timesheetdb.hours2 == 456.7
      assert timesheetdb.hours3 == 456.7
      assert timesheetdb.hours4 == 456.7
      assert timesheetdb.hours5 == 456.7
      assert timesheetdb.hours6 == 456.7
      assert timesheetdb.hours7 == 456.7
      assert timesheetdb.hours8 == 456.7
      assert timesheetdb.job_id1 == "some updated job_id1"
      assert timesheetdb.job_id2 == "some updated job_id2"
      assert timesheetdb.job_id3 == "some updated job_id3"
      assert timesheetdb.job_id4 == "some updated job_id4"
      assert timesheetdb.job_id5 == "some updated job_id5"
      assert timesheetdb.job_id6 == "some updated job_id6"
      assert timesheetdb.job_id7 == "some updated job_id7"
      assert timesheetdb.job_id8 == "some updated job_id8"
    end

    test "update_timesheetdb/2 with invalid data returns error changeset" do
      timesheetdb = timesheetdb_fixture()
      assert {:error, %Ecto.Changeset{}} = Timesheetdbs.update_timesheetdb(timesheetdb, @invalid_attrs)
      assert timesheetdb == Timesheetdbs.get_timesheetdb!(timesheetdb.id)
    end

    test "delete_timesheetdb/1 deletes the timesheetdb" do
      timesheetdb = timesheetdb_fixture()
      assert {:ok, %Timesheetdb{}} = Timesheetdbs.delete_timesheetdb(timesheetdb)
      assert_raise Ecto.NoResultsError, fn -> Timesheetdbs.get_timesheetdb!(timesheetdb.id) end
    end

    test "change_timesheetdb/1 returns a timesheetdb changeset" do
      timesheetdb = timesheetdb_fixture()
      assert %Ecto.Changeset{} = Timesheetdbs.change_timesheetdb(timesheetdb)
    end
  end
end
