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

    it "should increment the neighbor count for the cell to the north" do
      neighbor = point |> Point.north

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end

    it "should increment the neighbor count for the cell to the south" do
      neighbor = point |> Point.south

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end

    it "should increment the neighbor count for the cell to the west" do
      neighbor = point |> Point.west

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end

    it "should increment the neighbor count for the cell to the east" do
      neighbor = point |> Point.east

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end

    it "should increment the neighbor count for the cell to the northwest" do
      neighbor = point |> Point.northwest

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end

    it "should increment the neighbor count for the cell to the northeast" do
      neighbor = point |> Point.northeast

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end

    it "should increment the neighbor count for the cell to the southeast" do
      neighbor = point |> Point.southeast

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end

    it "should increment the neighbor count for the cell to the southwest" do
      neighbor = point |> Point.southwest

      expect World.state(world, neighbor) |> should(eq :dead)
      expect World.neighbors(world, neighbor) |> should(eq 1)
    end
  end
end
