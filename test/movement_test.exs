defmodule MovementTest do
  use ExUnit.Case

  describe "Movement.process/1" do
    test "moving forward out of bounds" do
      result = Movement.process({4, 8, "N"}, ["F"], {4,8})

      assert result == {4, 8, "N", "LOST"}
    end

    test "moving forward south within bounds" do
      result = Movement.process({4, 8, "S"}, ["F"], {4,8})

      assert result == {4, 7, "S"}
    end

    test "moving forward north within bounds" do
      result = Movement.process({4, 5, "N"}, ["F"], {4,8})

      assert result == {4, 6, "N"}
    end

    test "moving forward east within bounds" do
      result = Movement.process({1, 5, "E"}, ["F"], {4,8})

      assert result == {2, 5, "E"}
    end

    test "moving forward west within bounds" do
      result = Movement.process({4, 5, "W"}, ["F"], {4,8})

      assert result == {3, 5, "W"}
    end

    test "moving turning left from north" do
      result = Movement.process({4, 8, "N"}, ["L"], {4,8})

      assert result == {4, 8, "W"}
    end

    test "moving turning right from north" do
      result = Movement.process({4, 8, "N"}, ["R"], {4,8})

      assert result == {4, 8, "E"}
    end

    test "moving turning left from south" do
      result = Movement.process({4, 8, "S"}, ["L"], {4,8})

      assert result == {4, 8, "E"}
    end

    test "moving turning right from south" do
      result = Movement.process({4, 8, "S"}, ["R"], {4,8})

      assert result == {4, 8, "W"}
    end

    test "moving turning left from east" do
      result = Movement.process({4, 8, "E"}, ["L"], {4,8})

      assert result == {4, 8, "N"}
    end

    test "moving turning right from east" do
      result = Movement.process({4, 8, "E"}, ["R"], {4,8})

      assert result == {4, 8, "S"}
    end

    test "moving turning left from west" do
      result = Movement.process({4, 8, "W"}, ["L"], {4,8})

      assert result == {4, 8, "S"}
    end

    test "moving turning right from west" do
      result = Movement.process({4, 8, "W"}, ["R"], {4,8})

      assert result == {4, 8, "N"}
    end
  end
end
