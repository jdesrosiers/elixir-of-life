defmodule Life do
  defstruct state: :dead, neighbors: 0

  def dead, do: %__MODULE__{}
  def live, do: %__MODULE__{state: :live}
  def live(cell), do: %__MODULE__{state: :live, neighbors: cell.neighbors}

  def next_gen(:live, neighbors) when neighbors < 2, do: :dead # underpopulation
  def next_gen(:live, neighbors) when neighbors == 2 or neighbors == 3, do: :live # survival
  def next_gen(:live, neighbors) when neighbors > 3, do: :dead # overpopulation
  def next_gen(:dead, neighbors) when neighbors == 3, do: :live # reproduction
  def next_gen(state, _), do: state

  def add_neighbor(cell), do: %__MODULE__{cell | neighbors: cell.neighbors + 1}
end
