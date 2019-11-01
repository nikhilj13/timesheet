defmodule Timesheet.ManagerTest do
  use Timesheet.DataCase

  alias Timesheet.Manager

  describe "manager" do
    alias Timesheet.Manager.Managers

    @valid_attrs %{email: "some email", name: "some name", password: "some password"}
    @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password"}
    @invalid_attrs %{email: nil, name: nil, password: nil}

    def managers_fixture(attrs \\ %{}) do
      {:ok, managers} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Manager.create_managers()

      managers
    end

    test "list_manager/0 returns all manager" do
      managers = managers_fixture()
      assert Manager.list_manager() == [managers]
    end

    test "get_managers!/1 returns the managers with given id" do
      managers = managers_fixture()
      assert Manager.get_managers!(managers.id) == managers
    end

    test "create_managers/1 with valid data creates a managers" do
      assert {:ok, %Managers{} = managers} = Manager.create_managers(@valid_attrs)
      assert managers.email == "some email"
      assert managers.name == "some name"
      assert managers.password == "some password"
    end

    test "create_managers/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Manager.create_managers(@invalid_attrs)
    end

    test "update_managers/2 with valid data updates the managers" do
      managers = managers_fixture()
      assert {:ok, %Managers{} = managers} = Manager.update_managers(managers, @update_attrs)
      assert managers.email == "some updated email"
      assert managers.name == "some updated name"
      assert managers.password == "some updated password"
    end

    test "update_managers/2 with invalid data returns error changeset" do
      managers = managers_fixture()
      assert {:error, %Ecto.Changeset{}} = Manager.update_managers(managers, @invalid_attrs)
      assert managers == Manager.get_managers!(managers.id)
    end

    test "delete_managers/1 deletes the managers" do
      managers = managers_fixture()
      assert {:ok, %Managers{}} = Manager.delete_managers(managers)
      assert_raise Ecto.NoResultsError, fn -> Manager.get_managers!(managers.id) end
    end

    test "change_managers/1 returns a managers changeset" do
      managers = managers_fixture()
      assert %Ecto.Changeset{} = Manager.change_managers(managers)
    end
  end
end
