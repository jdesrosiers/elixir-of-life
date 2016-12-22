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

  describe "Neighbor count example" do
    # # # # # #
    # 1 1 2 1 1
    # 1 * 3 * 2
    # 1 1 3 * 2
    #     1 1 1
    let :world, do: World.empty
            |> World.add(%Point{x: 1, y: 1})
            |> World.add(%Point{x: 3, y: 2})
            |> World.add(%Point{x: 3, y: 1})

    it "should have 1 neighbor at (1, 0)", do: expect world |> World.neighbors(%Point{x: 1, y: 0}) |> should(eq 1)
    it "should have 1 neighbor at (3, 1)", do: expect world |> World.neighbors(%Point{x: 3, y: 1}) |> should(eq 1)
    it "should have 1 neighbor at (3, 2)", do: expect world |> World.neighbors(%Point{x: 3, y: 2}) |> should(eq 1)
    it "should have 2 neighbors at (2, 0)", do: expect world |> World.neighbors(%Point{x: 2, y: 0}) |> should(eq 2)
    it "should have 3 neighbors at (2, 1)", do: expect world |> World.neighbors(%Point{x: 2, y: 1}) |> should(eq 3)
  end

  describe "Adding a live cell where one already exists" do
    it "should not increment neighbors" do
      world = World.empty
              |> World.add(%Point{x: 1, y: 1})
              |> World.add(%Point{x: 1, y: 1})
      expect world |> World.neighbors(%Point{x: 0, y: 0}) |> should(eq 1)
    end
  end

  describe "Glider" do
    def to_points(input) do
      for {row, x} <- Enum.with_index(input),
          {value, y} <- Enum.with_index(row),
          value == 1 do
        %Point{x: x, y: y}
      end
    end

    def add(world, points), do: points |> Enum.reduce(world, &World.add(&2, &1))

    let :glider_0, do: World.empty |> add([
      [0, 1, 0, 0],
      [0, 0, 1, 0],
      [1, 1, 1, 0],
      [0, 0, 0, 0],
    ] |> to_points)

    let :glider_1, do: World.empty |> add([
      [0, 0, 0, 0],
      [1, 0, 1, 0],
      [0, 1, 1, 0],
      [0, 1, 0, 0]
    ] |> to_points)

    context "glider_0" do
      it "should become glider_1", do: expect glider_0 |> World.next_gen |> should(eq glider_1)
    end

    let :glider_2, do: World.empty |> add([
      [0, 0, 0, 0],
      [0, 0, 1, 0],
      [1, 0, 1, 0],
      [0, 1, 1, 0]
    ] |> to_points)

    context "glider_1" do
      it "should become glider_2", do: expect glider_1 |> World.next_gen |> should(eq glider_2)
    end

    let :glider_3, do: World.empty |> add([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 1, 1],
      [0, 1, 1, 0]
    ] |> to_points)

    context "glider_2" do
      it "should become glider_3", do: expect glider_2 |> World.next_gen |> should(eq glider_3)
    end

    let :glider_4, do: World.empty |> add([
      [0, 0, 0, 0],
      [0, 0, 1, 0],
      [0, 0, 0, 1],
      [0, 1, 1, 1]
    ] |> to_points)

    context "glider_3" do
      it "should become glider_4", do: expect glider_3 |> World.next_gen |> should(eq glider_4)
    end
  end
end
