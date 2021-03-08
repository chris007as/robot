defmodule Movement do

  def process(robot, [], _max_position) do
    robot
  end

  def process({x, y, orientation} = robot, moves, max_position) do
    [ head | tail ] = moves
    new_position = move(robot, head)

    if valid_position?(max_position, new_position) do
      process(new_position, tail, max_position)
    else
      {x, y, orientation, "LOST"}
    end
  end

  defp move({x, y, "N"}, "F") do
    {x, y + 1, "N"}
  end

  defp move({x, y, "E"}, "F") do
    {x + 1 , y, "E"}
  end

  defp move({x, y, "S"}, "F") do
    {x , y - 1, "S"}
  end

  defp move({x, y, "W"}, "F") do
    {x - 1, y, "W"}
  end

  defp move({x, y, "W"}, "L") do
    {x, y, "S"}
  end

  defp move({x, y, "W"}, "R") do
    {x, y, "N"}
  end

  defp move({x, y, "E"}, "R") do
    {x, y, "S"}
  end

  defp move({x, y, "E"}, "L") do
    {x, y, "N"}
  end

  defp move({x, y, "S"}, "R") do
    {x, y, "W"}
  end

  defp move({x, y, "S"}, "L") do
    {x, y, "E"}
  end

  defp move({x, y, "N"}, "R") do
    {x, y, "E"}
  end

  defp move({x, y, "N"}, "L") do
    {x, y, "W"}
  end

  defp valid_position?({max_x, max_y}, {x, y, _orientation}) when x >= 0 and y >= 0  do
    x <= max_x and y <= max_y
  end

  defp valid_position?(_max_position, _robot), do: false
end
