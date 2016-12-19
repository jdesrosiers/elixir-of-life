defmodule Life do
  def next_gen(:live, neighbors) when neighbors < 2, do: :dead # underpopulation
  def next_gen(:live, neighbors) when neighbors == 2 or neighbors == 3, do: :live # survival
  def next_gen(:live, neighbors) when neighbors > 3, do: :dead # overpopulation
  def next_gen(:dead, neighbors) when neighbors == 3, do: :live # reproduction
end
