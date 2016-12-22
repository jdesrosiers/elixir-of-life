defmodule World do
  def empty, do: %{}

  def state(world, point), do: Map.get(world, point, Life.dead).state
  def neighbors(world, point), do: Map.get(world, point, Life.dead).neighbors

  def neighbors(point), do: [
    &Point.northwest/1, &Point.north/1, &Point.northeast/1,
    &Point.west/1, &Point.east/1,
    &Point.southwest/1, &Point.south/1, &Point.southeast/1
  ] |> Enum.map(&(&1.(point)))

  def add(world, point) do
    case world[point] do
      %Life{state: :live} -> world
      _ -> world |> make_live(point) |> increment_neighbors(point)
    end
  end

  defp make_live(world, point), do: world |> Map.update(point, Life.live, &(&1 |> Life.live))
  defp increment_neighbors(world, point) do
    point |> neighbors |> Enum.reduce(world, fn neighbor, world ->
      world |> Map.update(neighbor, Life.dead |> Life.add_neighbor, &(&1 |> Life.add_neighbor))
    end)
  end
end
