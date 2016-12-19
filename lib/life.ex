defmodule Life do
  def next_gen(:live, neighbors) when neighbors < 2, do: :dead # underpopulation
end
