defmodule LifeSpec do
  use ESpec

  describe "Any live cell with fewer than two live neighbors" do
    it "should die in the next generation" do
      expect Life.next_gen(:live, 0) |> should(eq :dead)
      expect Life.next_gen(:live, 1) |> should(eq :dead)
    end
  end
end
