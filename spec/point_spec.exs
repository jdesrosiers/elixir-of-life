defmodule PointSpec do
  use ESpec

  describe "The point to the north" do
    it "should be the point shifted in the negative direction along the y axis" do
      expect %Point{x: 0, y: 0} |> Point.north |> should(eq %Point{x: 0, y: -1})
      expect %Point{x: 38475, y: 12343} |> Point.north |> should(eq %Point{x: 38475, y: 12342})
    end
  end

  describe "The point to the south" do
    it "should be the point shifted in the positive direction along the y axis" do
      expect %Point{x: 0, y: 0} |> Point.south |> should(eq %Point{x: 0, y: 1})
      expect %Point{x: 38475, y: 12343} |> Point.south |> should(eq %Point{x: 38475, y: 12344})
    end
  end

  describe "The point to the west" do
    it "should be the point shifted in the negative direction along the x axis" do
      expect %Point{x: 0, y: 0} |> Point.west |> should(eq %Point{x: -1, y: 0})
      expect %Point{x: 38475, y: 12343} |> Point.west |> should(eq %Point{x: 38474, y: 12343})
    end
  end

  describe "The point to the east" do
    it "should be the point shifted in the positive direction along the x axis" do
      expect %Point{x: 0, y: 0} |> Point.east |> should(eq %Point{x: 1, y: 0})
      expect %Point{x: 38475, y: 12343} |> Point.east |> should(eq %Point{x: 38476, y: 12343})
    end
  end

  describe "The point to the northwest" do
    it "should be the point shifted in the negative direction in both directions" do
      expect %Point{x: 0, y: 0} |> Point.northwest |> should(eq %Point{x: -1, y: -1})
      expect %Point{x: 38475, y: 12343} |> Point.northwest |> should(eq %Point{x: 38474, y: 12342})
    end
  end

  describe "The point to the northeast" do
    it "should be the point shifted in the negative direction on the y axis and in the positive direction on the x axis" do
      expect %Point{x: 0, y: 0} |> Point.northeast |> should(eq %Point{x: 1, y: -1})
      expect %Point{x: 38475, y: 12343} |> Point.northeast |> should(eq %Point{x: 38476, y: 12342})
    end
  end

  describe "The point to the southeast" do
    it "should be the point shifted in the positive direction in both directions" do
      expect %Point{x: 0, y: 0} |> Point.southeast |> should(eq %Point{x: 1, y: 1})
      expect %Point{x: 38475, y: 12343} |> Point.southeast |> should(eq %Point{x: 38476, y: 12344})
    end
  end

  describe "The point to the southwest" do
    it "should be the point shifted in the positive direction on the y axis and in the negative direction on the x axis" do
      expect %Point{x: 0, y: 0} |> Point.southwest |> should(eq %Point{x: -1, y: 1})
      expect %Point{x: 38475, y: 12343} |> Point.southwest |> should(eq %Point{x: 38474, y: 12344})
    end
  end
end
