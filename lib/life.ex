defmodule Life do
  def next_gen(:live, neighbors) when neighbors < 2, do: :dead # underpopulation
  def next_gen(:live, neighbors) when neighbors == 2 or neighbors == 3, do: :live # survival
end
