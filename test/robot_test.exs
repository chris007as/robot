defmodule RobotTest do
  use ExUnit.Case
  doctest Robot

  describe "Robot.process/1" do

    test "input file with grid and robots" do
      result = Robot.process("test/fixtures/robot/input.txt")

      assert result == "(2, 3, W)\n(1, 0, S) LOST"
    end
  end
end
