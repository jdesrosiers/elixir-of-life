defmodule Point do
  defstruct x: 0, y: 0

  def north(point), do: %__MODULE__{x: point.x, y: point.y - 1}
  def south(point), do: %__MODULE__{x: point.x, y: point.y + 1}
  def west(point), do: %__MODULE__{x: point.x - 1, y: point.y}
  def east(point), do: %__MODULE__{x: point.x + 1, y: point.y}

  def northwest(point), do: point |> north |> west
  def northeast(point), do: point |> north |> east
  def southwest(point), do: point |> south |> west
  def southeast(point), do: point |> south |> east
end
