defmodule Robot do
  @moduledoc """
  Documentation for `Robot`.
  """

  def process(input) do
    {:ok, data} = File.read(input)
    [grid_size | robots] = String.split(data , "\n", trim: true)
    max_point = furthest_point(grid_size)
    Enum.map(robots, fn robot -> create_robot(robot) end)
    |> Enum.map(fn robot ->
      Movement.process(robot[:robot], robot[:moves], max_point) |> format_output
    end)
    |> Enum.join("\n")
  end

  defp furthest_point(point) do
    point
    |> String.split(" ")
    |> Enum.map(fn point -> String.to_integer(point) end)
    |> case do
         [y, x] -> {x, y}
         _other -> raise ArgumentError, message: "invalid value entered"
       end
  end

  defp create_robot(robot) do
    [ location | movement ] = String.split(robot, ")")
    robot = String.split(location, ",")
            |> Enum.map(fn s -> String.trim(s) |> String.replace("(", "") end)
    [x, y, orientation ] = robot
    [ moves ] = movement

    %{ robot: {x |> String.to_integer, y |> String.to_integer, orientation},
       moves:  String.trim(moves) |> String.split("", trim: true) }
  end

  defp format_output({x, y, orientation, "LOST"}) do
    format_output({x, y, orientation}) <> " LOST"
  end

  defp format_output({x, y, orientation}) do
    "(#{x}, #{y}, #{orientation})"
  end
end
