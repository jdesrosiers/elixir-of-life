defmodule LifeSpec do
  use ESpec

  describe "Any live cell with fewer than two live neighbors" do
    it "should be dead in the next generation" do
      expect Life.next_gen(:live, 0) |> should(eq :dead)
      expect Life.next_gen(:live, 1) |> should(eq :dead)
    end
  end

  describe "Any live cell with two or three live neighbors" do
    it "should live on to the next generation" do
      expect Life.next_gen(:live, 2) |> should(eq :live)
      expect Life.next_gen(:live, 3) |> should(eq :live)
    end
  end

  describe "Any live cell with more than three live neighbors" do
    it "should be dead in the next generation" do
      expect Life.next_gen(:live, 4) |> should(eq :dead)
      expect Life.next_gen(:live, 8) |> should(eq :dead)
    end
  end
end
