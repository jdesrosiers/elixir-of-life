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

    it "should make that cell live", do: expect World.state(world, point) |> should(eq :live)

    def expect_one_neighbor(world, point), do: expect world |> World.neighbors(point) |> should(eq 1)

    it "should increment northwest neighbor count", do: expect_one_neighbor world, point |> Point.northwest
    it "should increment north neighbor count", do: expect_one_neighbor world, point |> Point.north
    it "should increment northeast neighbor count", do: expect_one_neighbor world, point |> Point.northeast
    it "should increment west neighbor count", do: expect_one_neighbor world, point |> Point.west
    it "should increment east neighbor count", do: expect_one_neighbor world, point |> Point.east
    it "should increment southeast neighbor count", do: expect_one_neighbor world, point |> Point.southeast
    it "should increment south neighbor count", do: expect_one_neighbor world, point |> Point.south
    it "should increment southwest neighbor count", do: expect_one_neighbor world, point |> Point.southwest
  end
end
