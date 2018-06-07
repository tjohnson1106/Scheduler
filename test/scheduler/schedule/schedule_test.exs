defmodule Scheduler.ScheduleTest do
  use Scheduler.DataCase

  alias Scheduler.Schedule

  describe "shifts" do
    alias Scheduler.Schedule.Shift

    @valid_attrs %{end_time: ~N[2010-04-17 14:00:00.000000], start_time: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{end_time: ~N[2011-05-18 15:01:01.000000], start_time: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{end_time: nil, start_time: nil}

    def shift_fixture(attrs \\ %{}) do
      {:ok, shift} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_shift()

      shift
    end

    test "list_shifts/0 returns all shifts" do
      shift = shift_fixture()
      assert Schedule.list_shifts() == [shift]
    end

    test "get_shift!/1 returns the shift with given id" do
      shift = shift_fixture()
      assert Schedule.get_shift!(shift.id) == shift
    end

    test "create_shift/1 with valid data creates a shift" do
      assert {:ok, %Shift{} = shift} = Schedule.create_shift(@valid_attrs)
      assert shift.end_time == ~N[2010-04-17 14:00:00.000000]
      assert shift.start_time == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_shift/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_shift(@invalid_attrs)
    end

    test "update_shift/2 with valid data updates the shift" do
      shift = shift_fixture()
      assert {:ok, shift} = Schedule.update_shift(shift, @update_attrs)
      assert %Shift{} = shift
      assert shift.end_time == ~N[2011-05-18 15:01:01.000000]
      assert shift.start_time == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_shift/2 with invalid data returns error changeset" do
      shift = shift_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_shift(shift, @invalid_attrs)
      assert shift == Schedule.get_shift!(shift.id)
    end

    test "delete_shift/1 deletes the shift" do
      shift = shift_fixture()
      assert {:ok, %Shift{}} = Schedule.delete_shift(shift)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_shift!(shift.id) end
    end

    test "change_shift/1 returns a shift changeset" do
      shift = shift_fixture()
      assert %Ecto.Changeset{} = Schedule.change_shift(shift)
    end
  end
end
