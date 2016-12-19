defmodule WorldSpec do
  use ESpec

  describe "An empty world" do
    let :world, do: World.empty
    it "should report all cells to be dead with 0 neighbors" do
      expect World.state(world, %Point{x: 0, y: 0}) |> should(eq :dead)
      expect World.neighbors(world, %Point{x: 0, y: 0}) |> should(eq 0)
      expect World.state(world, %Point{x: 346546, y: 6546590}) |> should(eq :dead)
      expect World.neighbors(world, %Point{x: 346546, y: 6546590}) |> should(eq 0)
    end
  end

  describe "Adding a live cell to an empty world" do
    let :point, do: %Point{x: 0, y: 0}
    let :world, do: World.empty |> World.add(point)

    it "should make that cell live with no neighbors" do
      expect World.state(world, point) |> should(eq :live)
      expect World.neighbors(world, point) |> should(eq 0)
    end

    xit "should increment the neighbor count for the cell above it" do
      neighbor = Point.north_of(point)

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end
  end
end
