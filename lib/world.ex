defmodule World do
  def empty, do: %{}
  def state(_world, _point), do: :dead
  def neighbors(_world, _point), do: 0
end
