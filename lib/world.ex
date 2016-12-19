defmodule World do
  def empty, do: %{}
  def state(world, point), do: Map.get(world, point, :dead)
  def neighbors(_world, _point), do: 0
  def add(world, point), do: put_in world[point], :live
end
